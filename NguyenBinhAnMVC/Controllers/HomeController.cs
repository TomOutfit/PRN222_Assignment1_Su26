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

        public async Task<IActionResult> Index()
        {
            var newsArticles = await _newsArticleService.GetActiveNewsAsync();
            var categories = await _categoryService.GetActiveCategoriesAsync();
            
            ViewBag.Categories = categories;
            return View(newsArticles);
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

        public async Task<IActionResult> Category(short id)
        {
            var category = await _categoryService.GetCategoryByIdAsync(id);
            if (category == null || category.IsActive != true)
            {
                return NotFound();
            }

            var newsArticles = await _newsArticleService.GetNewsByCategoryAsync(id);
            ViewBag.Category = category;
            ViewBag.Categories = await _categoryService.GetActiveCategoriesAsync();
            
            return View("Index", newsArticles);
        }

        public async Task<IActionResult> Search(string searchTerm)
        {
            if (string.IsNullOrWhiteSpace(searchTerm))
            {
                return RedirectToAction(nameof(Index));
            }

            var newsArticles = await _newsArticleService.SearchNewsAsync(searchTerm);
            ViewBag.Categories = await _categoryService.GetActiveCategoriesAsync();
            ViewBag.SearchTerm = searchTerm;
            
            return View("Index", newsArticles);
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
