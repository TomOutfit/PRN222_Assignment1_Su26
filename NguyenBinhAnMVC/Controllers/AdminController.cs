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

        public async Task<IActionResult> Accounts(string? searchTerm, int page = 1)
        {
            var authResult = RequireAdminRole();
            if (authResult != null) return authResult;

            const int pageSize = 5;
            if (page < 1) page = 1;

            var allAccounts = await _systemAccountService.GetAllAccountsAsync();

            if (!string.IsNullOrWhiteSpace(searchTerm))
            {
                allAccounts = allAccounts.Where(a =>
                    (a.AccountName?.Contains(searchTerm, StringComparison.OrdinalIgnoreCase) ?? false) ||
                    (a.AccountEmail?.Contains(searchTerm, StringComparison.OrdinalIgnoreCase) ?? false)).ToList();
                ViewBag.SearchTerm = searchTerm;
            }

            var paginatedAccounts = allAccounts
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            ViewBag.CurrentPage = page;
            ViewBag.TotalPages = (int)Math.Ceiling(allAccounts.ToList().Count / (double)pageSize);
            ViewBag.TotalItems = allAccounts.ToList().Count;
            ViewBag.PageSize = pageSize;

            return View(paginatedAccounts);
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

            try
            {
                await _systemAccountService.DeleteAccountAsync(id);
                TempData["SuccessMessage"] = "Account deleted successfully.";
            }
            catch (Exception)
            {
                TempData["ErrorMessage"] = "Cannot delete this account because it is associated with news articles or other data.";
            }
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

        [HttpGet]
        public async Task<IActionResult> ExportNewsReportJson(DateTime startDate, DateTime endDate)
        {
            var authResult = RequireAdminRole();
            if (authResult != null) return authResult;

            if (startDate > endDate)
            {
                return BadRequest("Start date must be before end date.");
            }

            var newsArticles = await _newsArticleService.GetNewsByDateRangeAsync(startDate, endDate);

            // Load accounts and categories for display names
            var accounts = await _systemAccountService.GetAllAccountsAsync();
            var categories = await _categoryService.GetActiveCategoriesAsync();

            var accountsDict = accounts.ToDictionary(a => a.AccountID, a => a.AccountName ?? "Unknown");
            var categoriesDict = categories.ToDictionary(c => c.CategoryID, c => c.CategoryName);

            var reportData = newsArticles.OrderByDescending(n => n.CreatedDate).Select(n => new
            {
                n.NewsArticleID,
                NewsTitle = n.NewsTitle ?? string.Empty,
                Headline = n.Headline ?? string.Empty,
                CreatedDate = n.CreatedDate?.ToString("yyyy-MM-dd HH:mm:ss") ?? "N/A",
                NewsContent = n.NewsContent ?? string.Empty,
                NewsSource = n.NewsSource ?? string.Empty,
                CategoryID = n.CategoryID,
                CategoryName = n.CategoryID.HasValue && categoriesDict.TryGetValue(n.CategoryID.Value, out var catName) ? catName : "N/A",
                Status = n.NewsStatus == true ? "Active" : "Inactive",
                CreatedByID = n.CreatedByID,
                CreatedByName = n.CreatedByID.HasValue && accountsDict.TryGetValue(n.CreatedByID.Value, out var accName) ? accName : "Unknown",
                UpdatedByID = n.UpdatedByID,
                ModifiedDate = n.ModifiedDate?.ToString("yyyy-MM-dd HH:mm:ss") ?? "N/A"
            }).ToList();

            var jsonString = System.Text.Json.JsonSerializer.Serialize(reportData, new System.Text.Json.JsonSerializerOptions
            {
                WriteIndented = true
            });

            var fileName = $"NewsReport_{startDate:yyyyMMdd}_to_{endDate:yyyyMMdd}.json";
            return File(System.Text.Encoding.UTF8.GetBytes(jsonString), "application/json", fileName);
        }

        [HttpGet]
        public async Task<IActionResult> ExportNewsReportExcel(DateTime startDate, DateTime endDate)
        {
            var authResult = RequireAdminRole();
            if (authResult != null) return authResult;

            if (startDate > endDate)
            {
                return BadRequest("Start date must be before end date.");
            }

            var newsArticles = await _newsArticleService.GetNewsByDateRangeAsync(startDate, endDate);

            // Load accounts and categories for display names
            var accounts = await _systemAccountService.GetAllAccountsAsync();
            var categories = await _categoryService.GetActiveCategoriesAsync();

            var accountsDict = accounts.ToDictionary(a => a.AccountID, a => a.AccountName ?? "Unknown");
            var categoriesDict = categories.ToDictionary(c => c.CategoryID, c => c.CategoryName);

            OfficeOpenXml.ExcelPackage.License.SetNonCommercialPersonal("TomOutfit");
            using (var package = new OfficeOpenXml.ExcelPackage())
            {
                var worksheet = package.Workbook.Worksheets.Add("News Report");

                // Headers
                worksheet.Cells[1, 1].Value = "Article ID";
                worksheet.Cells[1, 2].Value = "Title";
                worksheet.Cells[1, 3].Value = "Headline";
                worksheet.Cells[1, 4].Value = "Created Date";
                worksheet.Cells[1, 5].Value = "Source";
                worksheet.Cells[1, 6].Value = "Category";
                worksheet.Cells[1, 7].Value = "Status";
                worksheet.Cells[1, 8].Value = "Author";
                worksheet.Cells[1, 9].Value = "Modified Date";

                // Styling headers
                using (var range = worksheet.Cells[1, 1, 1, 9])
                {
                    range.Style.Font.Bold = true;
                    range.Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                    range.Style.Fill.BackgroundColor.SetColor(System.Drawing.Color.FromArgb(16, 185, 129)); // Excel-like green (#10b981)
                    range.Style.Font.Color.SetColor(System.Drawing.Color.White);
                    range.Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                }

                int row = 2;
                foreach (var news in newsArticles.OrderByDescending(n => n.CreatedDate))
                {
                    var authorName = news.CreatedByID.HasValue && accountsDict.TryGetValue(news.CreatedByID.Value, out var accName) ? accName : "Unknown";
                    var catName = news.CategoryID.HasValue && categoriesDict.TryGetValue(news.CategoryID.Value, out var cName) ? cName : "N/A";

                    worksheet.Cells[row, 1].Value = news.NewsArticleID;
                    worksheet.Cells[row, 2].Value = news.NewsTitle;
                    worksheet.Cells[row, 3].Value = news.Headline;
                    worksheet.Cells[row, 4].Value = news.CreatedDate?.ToString("yyyy-MM-dd HH:mm:ss");
                    worksheet.Cells[row, 5].Value = news.NewsSource;
                    worksheet.Cells[row, 6].Value = catName;
                    worksheet.Cells[row, 7].Value = news.NewsStatus == true ? "Active" : "Inactive";
                    worksheet.Cells[row, 8].Value = authorName;
                    worksheet.Cells[row, 9].Value = news.ModifiedDate?.ToString("yyyy-MM-dd HH:mm:ss");

                    row++;
                }

                // Auto-fit columns
                worksheet.Cells[worksheet.Dimension.Address].AutoFitColumns();

                var stream = new System.IO.MemoryStream();
                await package.SaveAsAsync(stream);
                stream.Position = 0;

                var fileName = $"NewsReport_{startDate:yyyyMMdd}_to_{endDate:yyyyMMdd}.xlsx";
                return File(stream.ToArray(), "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", fileName);
            }
        }
    }
}
