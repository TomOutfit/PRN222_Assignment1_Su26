using Microsoft.AspNetCore.Mvc;
using NguyenBinhAn_A01_Business.Services;

namespace NguyenBinhAnMVC.Controllers
{
    public class LecturerController : BaseController
    {
        private readonly INewsArticleService _newsArticleService;
        private readonly ICategoryService _categoryService;

        public LecturerController(INewsArticleService newsArticleService, ICategoryService categoryService)
        {
            _newsArticleService = newsArticleService;
            _categoryService = categoryService;
        }

        public async Task<IActionResult> Index()
        {
            var authResult = RequireAuthentication();
            if (authResult != null) return authResult;

            if (!IsLecturer())
            {
                return RedirectToAction("AccessDenied", "Auth");
            }

            var newsArticles = await _newsArticleService.GetActiveNewsAsync();
            var categories = await _categoryService.GetActiveCategoriesAsync();
            
            ViewBag.Categories = categories;
            ViewBag.UserName = GetCurrentUserEmail();
            
            return View(newsArticles);
        }

        public async Task<IActionResult> Details(string id)
        {
            var authResult = RequireAuthentication();
            if (authResult != null) return authResult;

            if (!IsLecturer())
            {
                return RedirectToAction("AccessDenied", "Auth");
            }

            var newsArticle = await _newsArticleService.GetNewsByIdAsync(id);
            
            if (newsArticle == null || newsArticle.NewsStatus != true)
            {
                return NotFound();
            }

            return View(newsArticle);
        }

        public async Task<IActionResult> Category(short id)
        {
            var authResult = RequireAuthentication();
            if (authResult != null) return authResult;

            if (!IsLecturer())
            {
                return RedirectToAction("AccessDenied", "Auth");
            }

            var category = await _categoryService.GetCategoryByIdAsync(id);
            if (category == null || category.IsActive != true)
            {
                return NotFound();
            }

            var newsArticles = await _newsArticleService.GetNewsByCategoryAsync(id);
            ViewBag.Category = category;
            ViewBag.Categories = await _categoryService.GetActiveCategoriesAsync();
            ViewBag.UserName = GetCurrentUserEmail();
            
            return View("Index", newsArticles);
        }

        public async Task<IActionResult> Search(string searchTerm)
        {
            var authResult = RequireAuthentication();
            if (authResult != null) return authResult;

            if (!IsLecturer())
            {
                return RedirectToAction("AccessDenied", "Auth");
            }

            if (string.IsNullOrWhiteSpace(searchTerm))
            {
                return RedirectToAction(nameof(Index));
            }

            var newsArticles = await _newsArticleService.SearchNewsAsync(searchTerm);
            ViewBag.Categories = await _categoryService.GetActiveCategoriesAsync();
            ViewBag.SearchTerm = searchTerm;
            ViewBag.UserName = GetCurrentUserEmail();
            
            return View("Index", newsArticles);
        }
    }
}
