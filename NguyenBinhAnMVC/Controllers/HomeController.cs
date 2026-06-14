using Microsoft.AspNetCore.Mvc;
using NguyenBinhAn_A01_Business.Services;
using NguyenBinhAnMVC.Models;
using System.Diagnostics;

namespace NguyenBinhAnMVC.Controllers
{
    public class HomeController : Controller
    {
        private readonly INewsArticleService _newsArticleService;
        private readonly ICategoryService _categoryService;

        public HomeController(INewsArticleService newsArticleService, ICategoryService categoryService)
        {
            _newsArticleService = newsArticleService;
            _categoryService = categoryService;
        }

        public async Task<IActionResult> Index(int page = 1)
        {
            const int pageSize = 4;
            if (page < 1) page = 1;

            var newsArticles = (await _newsArticleService.GetActiveNewsAsync()).ToList();
            var categories = await _categoryService.GetActiveCategoriesAsync();

            var paginatedNews = newsArticles
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToList();
            
            ViewBag.Categories = categories;
            ViewBag.CurrentPage = page;
            ViewBag.TotalPages = (int)Math.Ceiling(newsArticles.Count / (double)pageSize);
            ViewBag.TotalItems = newsArticles.Count;
            ViewBag.PageSize = pageSize;

            return View(paginatedNews);
        }

        public async Task<IActionResult> Details(string id)
        {
            var newsArticle = await _newsArticleService.GetNewsByIdAsync(id);

            if (newsArticle == null || newsArticle.NewsStatus != true)
            {
                return NotFound();
            }

            if (newsArticle.CategoryID.HasValue)
            {
                ViewBag.Category = await _categoryService.GetCategoryByIdAsync(newsArticle.CategoryID.Value);
            }

            var relatedNews = await _newsArticleService.GetActiveNewsAsync();
            ViewBag.RelatedNews = relatedNews
                .Where(n => n.CategoryID == newsArticle.CategoryID && n.NewsArticleID != id)
                .Take(3)
                .ToList();

            return View(newsArticle);
        }

        public async Task<IActionResult> Category(short id, int page = 1)
        {
            var category = await _categoryService.GetCategoryByIdAsync(id);
            if (category == null || category.IsActive != true)
            {
                return NotFound();
            }

            const int pageSize = 4;
            if (page < 1) page = 1;

            var newsArticles = (await _newsArticleService.GetNewsByCategoryAsync(id)).ToList();
            var categories = await _categoryService.GetActiveCategoriesAsync();

            var paginatedNews = newsArticles
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            ViewBag.Category = category;
            ViewBag.Categories = categories;
            ViewBag.CurrentPage = page;
            ViewBag.TotalPages = (int)Math.Ceiling(newsArticles.Count / (double)pageSize);
            ViewBag.TotalItems = newsArticles.Count;
            ViewBag.PageSize = pageSize;
            
            return View("Index", paginatedNews);
        }

        public async Task<IActionResult> Search(string searchTerm, int page = 1)
        {
            if (string.IsNullOrWhiteSpace(searchTerm))
            {
                return RedirectToAction(nameof(Index));
            }

            const int pageSize = 4;
            if (page < 1) page = 1;

            var newsArticles = (await _newsArticleService.SearchNewsAsync(searchTerm)).ToList();
            var categories = await _categoryService.GetActiveCategoriesAsync();

            var paginatedNews = newsArticles
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            ViewBag.Categories = categories;
            ViewBag.SearchTerm = searchTerm;
            ViewBag.CurrentPage = page;
            ViewBag.TotalPages = (int)Math.Ceiling(newsArticles.Count / (double)pageSize);
            ViewBag.TotalItems = newsArticles.Count;
            ViewBag.PageSize = pageSize;
            
            return View("Index", paginatedNews);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
