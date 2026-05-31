using Microsoft.EntityFrameworkCore;
using NguyenBinhAn_A01_Data;
using NguyenBinhAn_A01_Data.Models;
using NguyenBinhAn_A01_Business.Repositories;

namespace NguyenBinhAn_A01_Business.Services
{
    public class NewsArticleService : INewsArticleService
    {
        private readonly INewsArticleRepository _newsArticleRepository;
        private readonly ITagRepository _tagRepository;
        private readonly FUNewsManagementContext _context;

        public NewsArticleService(INewsArticleRepository newsArticleRepository, ITagRepository tagRepository, FUNewsManagementContext context)
        {
            _newsArticleRepository = newsArticleRepository;
            _tagRepository = tagRepository;
            _context = context;
        }

        public async Task<IEnumerable<NewsArticle>> GetActiveNewsAsync()
        {
            return await _newsArticleRepository.GetActiveNewsAsync();
        }

        public async Task<NewsArticle?> GetNewsByIdAsync(string id)
        {
            return await _newsArticleRepository.GetNewsWithTagsAsync(id);
        }

        public async Task<IEnumerable<NewsArticle>> GetNewsByCategoryAsync(short categoryId)
        {
            return await _newsArticleRepository.GetNewsByCategoryAsync(categoryId);
        }

        public async Task<IEnumerable<NewsArticle>> GetNewsByAuthorAsync(short authorId)
        {
            return await _newsArticleRepository.GetNewsByAuthorAsync(authorId);
        }

        public async Task<IEnumerable<NewsArticle>> SearchNewsAsync(string searchTerm)
        {
            return await _newsArticleRepository.SearchNewsAsync(searchTerm);
        }

        public async Task<IEnumerable<NewsArticle>> GetNewsByDateRangeAsync(DateTime startDate, DateTime endDate)
        {
            return await _newsArticleRepository.GetNewsByDateRangeAsync(startDate, endDate);
        }

        public async Task<NewsArticle> CreateNewsAsync(NewsArticle newsArticle, List<int> tagIds)
        {
            using var transaction = await _context.Database.BeginTransactionAsync();
            try
            {
                // Generate unique NewsArticleID (timestamp + random suffix)
                newsArticle.NewsArticleID = GenerateNewsArticleId();
                newsArticle.CreatedDate = DateTime.Now;
                var createdNews = await _newsArticleRepository.AddAsync(newsArticle);

                // Add tags
                if (tagIds != null && tagIds.Any())
                {
                    var newsTags = tagIds.Select(tagId => new NewsTag
                    {
                        NewsArticleID = createdNews.NewsArticleID,
                        TagID = tagId
                    }).ToList();

                    await _context.NewsTags.AddRangeAsync(newsTags);
                    await _context.SaveChangesAsync();
                }

                await transaction.CommitAsync();
                return createdNews;
            }
            catch
            {
                await transaction.RollbackAsync();
                throw;
            }
        }

        private string GenerateNewsArticleId()
        {
            // Format: yyyyMMddHHmmss + 6-char random alphanumeric = max 20 chars
            var timestamp = DateTime.Now.ToString("yyyyMMddHHmmss");
            var random = Guid.NewGuid().ToString("N").Substring(0, 6).ToUpper();
            return $"{timestamp}{random}";
        }

        public async Task<NewsArticle> UpdateNewsAsync(NewsArticle newsArticle, List<int> tagIds)
        {
            using var transaction = await _context.Database.BeginTransactionAsync();
            try
            {
                newsArticle.ModifiedDate = DateTime.Now;
                await _newsArticleRepository.UpdateAsync(newsArticle);

                // Update tags
                var existingNewsTags = await _context.NewsTags
                    .Where(nt => nt.NewsArticleID == newsArticle.NewsArticleID)
                    .ToListAsync();

                _context.NewsTags.RemoveRange(existingNewsTags);

                if (tagIds != null && tagIds.Any())
                {
                    var newsTags = tagIds.Select(tagId => new NewsTag
                    {
                        NewsArticleID = newsArticle.NewsArticleID,
                        TagID = tagId
                    }).ToList();

                    await _context.NewsTags.AddRangeAsync(newsTags);
                }

                await _context.SaveChangesAsync();
                await transaction.CommitAsync();

                return await _newsArticleRepository.GetNewsWithTagsAsync(newsArticle.NewsArticleID) ?? newsArticle;
            }
            catch
            {
                await transaction.RollbackAsync();
                throw;
            }
        }

        public async Task DeleteNewsAsync(string id)
        {
            var newsArticle = await _newsArticleRepository.GetNewsWithTagsAsync(id);
            if (newsArticle != null)
            {
                // Remove related NewsTags first
                var newsTags = await _context.NewsTags
                    .Where(nt => nt.NewsArticleID == id)
                    .ToListAsync();

                _context.NewsTags.RemoveRange(newsTags);
                await _context.SaveChangesAsync();

                await _newsArticleRepository.DeleteAsync(newsArticle);
            }
        }

        public async Task<IEnumerable<NewsArticle>> GetNewsHistoryAsync(short authorId)
        {
            return await _newsArticleRepository.GetNewsByAuthorAsync(authorId);
        }

        public async Task<List<int>> GetTagIdsByNewsIdAsync(string newsArticleId)
        {
            return await _newsArticleRepository.GetTagIdsByNewsIdAsync(newsArticleId);
        }

        public async Task<int> GetTotalNewsCountAsync()
        {
            return await _context.NewsArticles.CountAsync();
        }

        public async Task<int> GetActiveNewsCountAsync()
        {
            return await _context.NewsArticles.CountAsync(n => n.NewsStatus == true);
        }

        public async Task<int> GetUserNewsCountAsync(short authorId)
        {
            return await _context.NewsArticles.CountAsync(n => n.CreatedByID == authorId);
        }
    }
}
