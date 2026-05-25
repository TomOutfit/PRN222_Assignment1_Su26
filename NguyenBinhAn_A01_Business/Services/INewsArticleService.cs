using NguyenBinhAn_A01_Data.Models;

namespace NguyenBinhAn_A01_Business.Services
{
    public interface INewsArticleService
    {
        Task<IEnumerable<NewsArticle>> GetActiveNewsAsync();
        Task<NewsArticle?> GetNewsByIdAsync(string id);
        Task<IEnumerable<NewsArticle>> GetNewsByCategoryAsync(short categoryId);
        Task<IEnumerable<NewsArticle>> GetNewsByAuthorAsync(short authorId);
        Task<IEnumerable<NewsArticle>> SearchNewsAsync(string searchTerm);
        Task<IEnumerable<NewsArticle>> GetNewsByDateRangeAsync(DateTime startDate, DateTime endDate);
        Task<NewsArticle> CreateNewsAsync(NewsArticle newsArticle, List<int> tagIds);
        Task<NewsArticle> UpdateNewsAsync(NewsArticle newsArticle, List<int> tagIds);
        Task DeleteNewsAsync(string id);
        Task<IEnumerable<NewsArticle>> GetNewsHistoryAsync(short authorId);
        Task<List<int>> GetTagIdsByNewsIdAsync(string newsArticleId);
        Task<int> GetTotalNewsCountAsync();
        Task<int> GetActiveNewsCountAsync();
        Task<int> GetUserNewsCountAsync(short authorId);
    }
}
