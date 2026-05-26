namespace NguyenBinhAn_A01_Business.Services
{
    public interface IDashboardService
    {
        Task<Dictionary<string, int>> GetAccountsByRoleAsync();
        Task<List<Dictionary<string, object>>> GetNewsPerMonthAsync(int monthsBack = 6);
        Task<Dictionary<string, int>> GetNewsByCategoryAsync();
        Task<Dictionary<string, int>> GetActiveVsInactiveAsync();
    }
}
