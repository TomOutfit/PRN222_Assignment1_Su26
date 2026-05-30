using Microsoft.AspNetCore.Mvc;
using NguyenBinhAn_A01_Business.Services;
using NguyenBinhAn_A01_Data.Models;

namespace NguyenBinhAnMVC.Controllers
{
    public class AdminController : BaseController
    {
        private readonly ISystemAccountService _systemAccountService;
        private readonly INewsArticleService _newsArticleService;
        private readonly ICategoryService _categoryService;
        private readonly IDashboardService _dashboardService;

        public AdminController(ISystemAccountService systemAccountService,
            INewsArticleService newsArticleService,
            ICategoryService categoryService,
            IDashboardService dashboardService)
        {
            _systemAccountService = systemAccountService;
            _newsArticleService = newsArticleService;
            _categoryService = categoryService;
            _dashboardService = dashboardService;
        }

        public async Task<IActionResult> Dashboard()
        {
            var authResult = RequireAdminRole();
            if (authResult != null) return authResult;

            ViewBag.TotalAccounts = await _systemAccountService.GetTotalAccountCountAsync();
            ViewBag.StaffCount = await _systemAccountService.GetAccountCountByRoleAsync(1);
            ViewBag.LecturerCount = await _systemAccountService.GetAccountCountByRoleAsync(2);
            ViewBag.TotalNews = await _newsArticleService.GetTotalNewsCountAsync();

            return View();
        }

        [HttpGet]
        public async Task<IActionResult> GetStats()
        {
            var authResult = RequireAdminRole();
            if (authResult != null) return Unauthorized();

            return Json(new
            {
                totalAccounts = await _systemAccountService.GetTotalAccountCountAsync(),
                staffCount = await _systemAccountService.GetAccountCountByRoleAsync(1),
                lecturerCount = await _systemAccountService.GetAccountCountByRoleAsync(2),
                totalNews = await _newsArticleService.GetTotalNewsCountAsync()
            });
        }

        [HttpGet]
        public async Task<IActionResult> GetChartData()
        {
            var authResult = RequireAdminRole();
            if (authResult != null) return Unauthorized();

            var accountsByRole = await _dashboardService.GetAccountsByRoleAsync();
            var newsPerMonth = await _dashboardService.GetNewsPerMonthAsync();

            return Json(new
            {
                accountsByRole,
                newsPerMonth
            });
        }

        // ── Account Management ──────────────────────────────────────────────

        public async Task<IActionResult> Accounts(string? searchTerm)
        {
            var authResult = RequireAdminRole();
            if (authResult != null) return authResult;

            var accounts = await _systemAccountService.GetAllAccountsAsync();

            if (!string.IsNullOrWhiteSpace(searchTerm))
            {
                accounts = accounts.Where(a =>
                    (a.AccountName?.Contains(searchTerm, StringComparison.OrdinalIgnoreCase) ?? false) ||
                    (a.AccountEmail?.Contains(searchTerm, StringComparison.OrdinalIgnoreCase) ?? false));
                ViewBag.SearchTerm = searchTerm;
            }

            return View(accounts);
        }

        [HttpGet]
        public IActionResult CreateAccount()
        {
            var authResult = RequireAdminRole();
            if (authResult != null) return authResult;
            return View(new SystemAccount());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateAccount(SystemAccount account)
        {
            var authResult = RequireAdminRole();
            if (authResult != null) return authResult;

            // Check duplicate email
            if (await _systemAccountService.IsEmailExistsAsync(account.AccountEmail ?? ""))
            {
                ModelState.AddModelError("AccountEmail", "This email is already in use.");
            }

            if (ModelState.IsValid)
            {
                await _systemAccountService.CreateAccountAsync(account);
                TempData["SuccessMessage"] = "Account created successfully.";
                return RedirectToAction(nameof(Accounts));
            }
            return View(account);
        }

        [HttpGet]
        public async Task<IActionResult> EditAccount(short id)
        {
            var authResult = RequireAdminRole();
            if (authResult != null) return authResult;

            var account = await _systemAccountService.GetAccountByIdAsync(id);
            if (account == null) return NotFound();
            return View(account);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EditAccount(SystemAccount account)
        {
            var authResult = RequireAdminRole();
            if (authResult != null) return authResult;

            // Check duplicate email (exclude current account)
            if (await _systemAccountService.IsEmailExistsAsync(account.AccountEmail ?? "", account.AccountID))
            {
                ModelState.AddModelError("AccountEmail", "This email is already in use.");
            }

            if (ModelState.IsValid)
            {
                await _systemAccountService.UpdateAccountAsync(account);
                TempData["SuccessMessage"] = "Account updated successfully.";
                return RedirectToAction(nameof(Accounts));
            }
            return View(account);
        }

        [HttpGet]
        public async Task<IActionResult> DeleteAccount(short id)
        {
            var authResult = RequireAdminRole();
            if (authResult != null) return authResult;

            var account = await _systemAccountService.GetAccountByIdAsync(id);
            if (account == null) return NotFound();
            return View(account);
        }

        [HttpPost, ActionName("DeleteAccount")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteAccountConfirmed(short id)
        {
            var authResult = RequireAdminRole();
            if (authResult != null) return authResult;

            await _systemAccountService.DeleteAccountAsync(id);
            TempData["SuccessMessage"] = "Account deleted successfully.";
            return RedirectToAction(nameof(Accounts));
        }

        // ── Reports ─────────────────────────────────────────────────────────

        public IActionResult Reports()
        {
            var authResult = RequireAdminRole();
            if (authResult != null) return authResult;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> NewsReport(DateTime startDate, DateTime endDate)
        {
            var authResult = RequireAdminRole();
            if (authResult != null) return authResult;

            if (startDate > endDate)
            {
                ModelState.AddModelError("", "Start date must be before end date.");
                return View("Reports");
            }

            var newsArticles = await _newsArticleService.GetNewsByDateRangeAsync(startDate, endDate);

            // Load accounts and categories for display names
            var accounts = await _systemAccountService.GetAllAccountsAsync();
            var categories = await _categoryService.GetActiveCategoriesAsync();

            ViewBag.StartDate = startDate;
            ViewBag.EndDate = endDate;
            ViewBag.AccountsDict = accounts.ToDictionary(a => a.AccountID, a => a.AccountName ?? "Unknown");
            ViewBag.CategoriesDict = categories.ToDictionary(c => c.CategoryID, c => c.CategoryName);

            return View("NewsReport", newsArticles);
        }
    }
}
