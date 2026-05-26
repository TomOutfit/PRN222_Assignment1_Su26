using System.Globalization;
using Microsoft.EntityFrameworkCore;
using NguyenBinhAn_A01_Data;

namespace NguyenBinhAn_A01_Business.Services
{
    public class DashboardService : IDashboardService
    {
        private readonly FUNewsManagementContext _context;

        public DashboardService(FUNewsManagementContext context)
        {
            _context = context;
        }

        public async Task<Dictionary<string, int>> GetAccountsByRoleAsync()
        {
            var data = await _context.SystemAccounts
                .GroupBy(a => a.AccountRole)
                .Select(g => new { Role = g.Key, Count = g.Count() })
                .ToListAsync();

            var roleNames = new Dictionary<int?, string>
            {
                { 0, "Admin" },
                { 1, "Staff" },
                { 2, "Lecturer" }
            };

            return data.ToDictionary(
                x => roleNames.TryGetValue(x.Role, out var name) ? name : $"Role {x.Role}",
                x => x.Count);
        }

        public async Task<List<Dictionary<string, object>>> GetNewsPerMonthAsync(int monthsBack = 6)
        {
            var cutoff = DateTime.Now.AddMonths(-monthsBack + 1).Date.AddDays(1 - DateTime.Now.Day);
            var data = await _context.NewsArticles
                .Where(n => n.CreatedDate.HasValue && n.CreatedDate >= cutoff)
                .GroupBy(n => new { n.CreatedDate.Value.Year, n.CreatedDate.Value.Month })
                .Select(g => new { g.Key.Year, g.Key.Month, Count = g.Count() })
                .OrderBy(g => g.Year).ThenBy(g => g.Month)
                .ToListAsync();

            return data.Select(d => new Dictionary<string, object>
            {
                { "year", d.Year },
                { "month", d.Month },
                { "count", d.Count },
                { "label", CultureInfo.InvariantCulture.DateTimeFormat.GetMonthName(d.Month).Substring(0, 3) + " " + d.Year }
            }).ToList();
        }

        public async Task<Dictionary<string, int>> GetNewsByCategoryAsync()
        {
            var newsWithCategories = await _context.NewsArticles
                .Where(n => n.NewsStatus == true && n.CategoryID != null)
                .Join(_context.Categories,
                    n => n.CategoryID,
                    c => c.CategoryID,
                    (n, c) => c.CategoryName)
                .ToListAsync();

            var data = newsWithCategories
                .GroupBy(name => name)
                .Select(g => new { Category = g.Key, Count = g.Count() })
                .OrderByDescending(x => x.Count)
                .ToList();

            return data.ToDictionary(x => x.Category, x => x.Count);
        }

        public async Task<Dictionary<string, int>> GetActiveVsInactiveAsync()
        {
            var active = await _context.NewsArticles.CountAsync(n => n.NewsStatus == true);
            var inactive = await _context.NewsArticles.CountAsync(n => n.NewsStatus == false);
            return new Dictionary<string, int> { { "Active", active }, { "Inactive", inactive } };
        }
    }
}
