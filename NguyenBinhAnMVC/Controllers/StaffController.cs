using Microsoft.AspNetCore.Mvc;
using NguyenBinhAn_A01_Business.Services;
using NguyenBinhAn_A01_Data.Models;

namespace NguyenBinhAnMVC.Controllers
{
    public class StaffController : BaseController
    {
        private readonly ICategoryService _categoryService;
        private readonly INewsArticleService _newsArticleService;
        private readonly ITagService _tagService;
        private readonly ISystemAccountService _systemAccountService;
        private readonly IDashboardService _dashboardService;

        public StaffController(ICategoryService categoryService, INewsArticleService newsArticleService,
            ITagService tagService, ISystemAccountService systemAccountService,
            IDashboardService dashboardService)
        {
            _categoryService = categoryService;
            _newsArticleService = newsArticleService;
            _tagService = tagService;
            _systemAccountService = systemAccountService;
            _dashboardService = dashboardService;
        }

        public async Task<IActionResult> Dashboard()
        {
            var authResult = RequireStaffRole();
            if (authResult != null) return authResult;

            var userId = GetCurrentUserId()!.Value;
            ViewBag.CategoryCount = await _categoryService.GetCategoryCountAsync();
            ViewBag.NewsCount = await _newsArticleService.GetTotalNewsCountAsync();
            ViewBag.ActiveNewsCount = await _newsArticleService.GetActiveNewsCountAsync();
            ViewBag.UserNewsCount = await _newsArticleService.GetUserNewsCountAsync(userId);

            return View();
        }

        [HttpGet]
        public async Task<IActionResult> GetStats()
        {
            var authResult = RequireStaffRole();
            if (authResult != null) return Unauthorized();

            var userId = GetCurrentUserId()!.Value;
            return Json(new
            {
                categoryCount = await _categoryService.GetCategoryCountAsync(),
                newsCount = await _newsArticleService.GetTotalNewsCountAsync(),
                activeNewsCount = await _newsArticleService.GetActiveNewsCountAsync(),
                userNewsCount = await _newsArticleService.GetUserNewsCountAsync(userId)
            });
        }

        [HttpGet]
        public async Task<IActionResult> GetChartData()
        {
            var authResult = RequireStaffRole();
            if (authResult != null) return Unauthorized();

            var newsByCategory = await _dashboardService.GetNewsByCategoryAsync();
            var activeVsInactive = await _dashboardService.GetActiveVsInactiveAsync();

            return Json(new { newsByCategory, activeVsInactive });
        }

        // ── Category Management ─────────────────────────────────────────────

        public async Task<IActionResult> Categories(string? searchTerm, int page = 1)
        {
            var authResult = RequireStaffRole();
            if (authResult != null) return authResult;

            const int pageSize = 5;
            if (page < 1) page = 1;

            var allCategories = (await _categoryService.GetActiveCategoriesAsync()).ToList();

            if (!string.IsNullOrWhiteSpace(searchTerm))
            {
                allCategories = allCategories
                    .Where(c => c.CategoryName.Contains(searchTerm, StringComparison.OrdinalIgnoreCase) ||
                                c.CategoryDescription.Contains(searchTerm, StringComparison.OrdinalIgnoreCase))
                    .ToList();
                ViewBag.SearchTerm = searchTerm;
            }

            var paginatedCategories = allCategories
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            // Pass parent categories for the Create/Edit modals
            ViewBag.ParentCategories = await _categoryService.GetParentCategoriesAsync();
            ViewBag.CurrentPage = page;
            ViewBag.TotalPages = (int)Math.Ceiling(allCategories.Count / (double)pageSize);
            ViewBag.TotalItems = allCategories.Count;
            ViewBag.PageSize = pageSize;

            return View(paginatedCategories);
        }

        [HttpGet]
        public async Task<IActionResult> CreateCategory()
        {
            var authResult = RequireStaffRole();
            if (authResult != null) return authResult;

            ViewBag.ParentCategories = await _categoryService.GetParentCategoriesAsync();
            return View(new Category());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateCategory(Category category)
        {
            var authResult = RequireStaffRole();
            if (authResult != null) return authResult;

            if (ModelState.IsValid)
            {
                await _categoryService.CreateCategoryAsync(category);
                TempData["SuccessMessage"] = "Category created successfully.";
                return RedirectToAction(nameof(Categories));
            }

            ViewBag.ParentCategories = await _categoryService.GetParentCategoriesAsync();
            // Re-show categories list with modal open flag
            var categories = await _categoryService.GetActiveCategoriesAsync();
            ViewBag.ShowCreateModal = true;
            return View("Categories", categories);
        }

        [HttpGet]
        public async Task<IActionResult> EditCategory(short id)
        {
            var authResult = RequireStaffRole();
            if (authResult != null) return authResult;

            var category = await _categoryService.GetCategoryByIdAsync(id);
            if (category == null) return NotFound();

            var parentCategories = await _categoryService.GetParentCategoriesAsync();
            ViewBag.ParentCategories = parentCategories.Where(c => c.CategoryID != id).ToList();
            return View(category);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EditCategory(Category category)
        {
            var authResult = RequireStaffRole();
            if (authResult != null) return authResult;

            if (ModelState.IsValid)
            {
                await _categoryService.UpdateCategoryAsync(category);
                TempData["SuccessMessage"] = "Category updated successfully.";
                return RedirectToAction(nameof(Categories));
            }

            var parentCategories = await _categoryService.GetParentCategoriesAsync();
            ViewBag.ParentCategories = parentCategories.Where(c => c.CategoryID != category.CategoryID).ToList();
            return View(category);
        }

        [HttpGet]
        public async Task<IActionResult> DeleteCategory(short id)
        {
            var authResult = RequireStaffRole();
            if (authResult != null) return authResult;

            var category = await _categoryService.GetCategoryByIdAsync(id);
            if (category == null) return NotFound();

            if (await _categoryService.CanDeleteCategoryAsync(id))
            {
                return View(category);
            }
            else
            {
                ViewBag.ErrorMessage = "Cannot delete this category because it is associated with one or more news articles.";
                return View("DeleteError", category);
            }
        }

        [HttpPost, ActionName("DeleteCategory")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteCategoryConfirmed(short id)
        {
            var authResult = RequireStaffRole();
            if (authResult != null) return authResult;

            await _categoryService.DeleteCategoryAsync(id);
            TempData["SuccessMessage"] = "Category deleted successfully.";
            return RedirectToAction(nameof(Categories));
        }

        // ── News Management ─────────────────────────────────────────────────

        public async Task<IActionResult> News(string? searchTerm, int page = 1)
        {
            var authResult = RequireStaffRole();
            if (authResult != null) return authResult;

            const int pageSize = 5;
            if (page < 1) page = 1;

            var userId = GetCurrentUserId()!.Value;
            var allNews = (await _newsArticleService.GetNewsByAuthorAsync(userId)).ToList();

            if (!string.IsNullOrWhiteSpace(searchTerm))
            {
                allNews = allNews
                    .Where(n => (n.NewsTitle?.Contains(searchTerm, StringComparison.OrdinalIgnoreCase) ?? false) ||
                                (n.Headline?.Contains(searchTerm, StringComparison.OrdinalIgnoreCase) ?? false))
                    .ToList();
                ViewBag.SearchTerm = searchTerm;
            }

            var paginatedNews = allNews
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            // Load categories and tags for Create/Edit modals + display names
            var categories = await _categoryService.GetActiveCategoriesAsync();
            var tags = await _tagService.GetAllTagsAsync();
            ViewBag.CategoriesDict = categories.ToDictionary(c => c.CategoryID, c => c.CategoryName);
            ViewBag.Categories = categories;
            ViewBag.Tags = tags;
            ViewBag.CurrentPage = page;
            ViewBag.TotalPages = (int)Math.Ceiling(allNews.Count / (double)pageSize);
            ViewBag.TotalItems = allNews.Count;
            ViewBag.PageSize = pageSize;

            return View(paginatedNews);
        }

        [HttpGet]
        public async Task<IActionResult> CreateNews()
        {
            var authResult = RequireStaffRole();
            if (authResult != null) return authResult;

            ViewBag.Categories = await _categoryService.GetActiveCategoriesAsync();
            ViewBag.Tags = await _tagService.GetAllTagsAsync();
            return View(new NewsArticle());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateNews(NewsArticle newsArticle, List<int> selectedTags)
        {
            var authResult = RequireStaffRole();
            if (authResult != null) return authResult;

            if (ModelState.IsValid)
            {
                newsArticle.CreatedByID = GetCurrentUserId()!.Value;
                newsArticle.UpdatedByID = GetCurrentUserId()!.Value;
                await _newsArticleService.CreateNewsAsync(newsArticle, selectedTags);
                TempData["SuccessMessage"] = "News article created successfully.";
                return RedirectToAction(nameof(News));
            }

            ViewBag.Categories = await _categoryService.GetActiveCategoriesAsync();
            ViewBag.Tags = await _tagService.GetAllTagsAsync();
            return View(newsArticle);
        }

        [HttpGet]
        public async Task<IActionResult> EditNews(string id)
        {
            var authResult = RequireStaffRole();
            if (authResult != null) return authResult;

            var newsArticle = await _newsArticleService.GetNewsByIdAsync(id);
            if (newsArticle == null) return NotFound();

            if (newsArticle.CreatedByID != GetCurrentUserId()!.Value)
            {
                return RedirectToAction("AccessDenied", "Auth");
            }

            var selectedTagIds = await _newsArticleService.GetTagIdsByNewsIdAsync(id);

            ViewBag.Categories = await _categoryService.GetActiveCategoriesAsync();
            ViewBag.Tags = await _tagService.GetAllTagsAsync();
            ViewBag.SelectedTags = selectedTagIds;

            return View(newsArticle);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EditNews(NewsArticle newsArticle, List<int> selectedTags)
        {
            var authResult = RequireStaffRole();
            if (authResult != null) return authResult;

            if (ModelState.IsValid)
            {
                newsArticle.UpdatedByID = GetCurrentUserId()!.Value;
                await _newsArticleService.UpdateNewsAsync(newsArticle, selectedTags);
                TempData["SuccessMessage"] = "News article updated successfully.";
                return RedirectToAction(nameof(News));
            }

            ViewBag.Categories = await _categoryService.GetActiveCategoriesAsync();
            ViewBag.Tags = await _tagService.GetAllTagsAsync();
            ViewBag.SelectedTags = selectedTags;
            return View(newsArticle);
        }

        [HttpGet]
        public async Task<IActionResult> DeleteNews(string id)
        {
            var authResult = RequireStaffRole();
            if (authResult != null) return authResult;

            var newsArticle = await _newsArticleService.GetNewsByIdAsync(id);
            if (newsArticle == null) return NotFound();

            if (newsArticle.CreatedByID != GetCurrentUserId()!.Value)
            {
                return RedirectToAction("AccessDenied", "Auth");
            }

            return View(newsArticle);
        }

        [HttpPost, ActionName("DeleteNews")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteNewsConfirmed(string id)
        {
            var authResult = RequireStaffRole();
            if (authResult != null) return authResult;

            await _newsArticleService.DeleteNewsAsync(id);
            TempData["SuccessMessage"] = "News article deleted successfully.";
            return RedirectToAction(nameof(News));
        }

        // ── Profile ─────────────────────────────────────────────────────────

        [HttpGet]
        public async Task<IActionResult> Profile()
        {
            var authResult = RequireStaffRole();
            if (authResult != null) return authResult;

            var account = await _systemAccountService.GetAccountByIdAsync(GetCurrentUserId()!.Value);
            if (account == null) return NotFound();
            return View(account);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Profile(SystemAccount account)
        {
            var authResult = RequireStaffRole();
            if (authResult != null) return authResult;

            // Remove role from validation — staff cannot change their own role
            ModelState.Remove("AccountRole");

            if (ModelState.IsValid)
            {
                // Preserve role from session
                account.AccountRole = GetCurrentUserRole();
                await _systemAccountService.UpdateAccountAsync(account);
                TempData["SuccessMessage"] = "Profile updated successfully.";
                return RedirectToAction(nameof(Profile));
            }

            return View(account);
        }

        // ── AJAX endpoint for Edit News modal ───────────────────────────────

        [HttpGet]
        public async Task<IActionResult> GetNewsJson(string id)
        {
            var authResult = RequireStaffRole();
            if (authResult != null) return Unauthorized();

            var news = await _newsArticleService.GetNewsByIdAsync(id);
            if (news == null) return NotFound();

            if (news.CreatedByID != GetCurrentUserId()!.Value)
                return Forbid();

            var tagIds = await _newsArticleService.GetTagIdsByNewsIdAsync(id);

            return Json(new
            {
                newsArticleID = news.NewsArticleID,
                newsTitle     = news.NewsTitle,
                headline      = news.Headline,
                newsContent   = news.NewsContent,
                newsSource    = news.NewsSource,
                categoryID    = news.CategoryID,
                newsStatus    = news.NewsStatus,
                createdByID   = news.CreatedByID,
                createdDate   = news.CreatedDate?.ToString("o"),
                tagIds
            });
        }

        // ── News History ────────────────────────────────────────────────────

        public async Task<IActionResult> NewsHistory(int page = 1)
        {
            var authResult = RequireStaffRole();
            if (authResult != null) return authResult;

            const int pageSize = 5;
            if (page < 1) page = 1;

            var userId = GetCurrentUserId()!.Value;
            var allHistory = (await _newsArticleService.GetNewsHistoryAsync(userId)).OrderByDescending(n => n.CreatedDate).ToList();

            var paginatedHistory = allHistory
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            var categories = await _categoryService.GetActiveCategoriesAsync();
            ViewBag.CategoriesDict = categories.ToDictionary(c => c.CategoryID, c => c.CategoryName);
            ViewBag.CurrentPage = page;
            ViewBag.TotalPages = (int)Math.Ceiling(allHistory.Count / (double)pageSize);
            ViewBag.TotalItems = allHistory.Count;
            ViewBag.PageSize = pageSize;

            return View(paginatedHistory);
        }
    }
}
