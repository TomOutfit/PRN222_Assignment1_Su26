using Microsoft.EntityFrameworkCore;
using NguyenBinhAn_A01_Data;
using NguyenBinhAn_A01_Data.Models;

namespace NguyenBinhAn_A01_Business.Repositories
{
    public class NewsArticleRepository : Repository<NewsArticle>, INewsArticleRepository
    {
        public NewsArticleRepository(FUNewsManagementContext context) : base(context)
        {
        }

        public async Task<IEnumerable<NewsArticle>> GetActiveNewsAsync()
        {
            return await _dbSet
                .Where(na => na.NewsStatus == true)
                .OrderByDescending(na => na.CreatedDate)
                .ToListAsync();
        }

        public async Task<IEnumerable<NewsArticle>> GetNewsByCategoryAsync(short categoryId)
        {
            return await _dbSet
                .Where(na => na.CategoryID == categoryId && na.NewsStatus == true)
                .OrderByDescending(na => na.CreatedDate)
                .ToListAsync();
        }

        // Returns ALL articles by author (active + inactive) so Staff can manage their own articles
        public async Task<IEnumerable<NewsArticle>> GetNewsByAuthorAsync(short authorId)
        {
            return await _dbSet
                .Where(na => na.CreatedByID == authorId)
                .OrderByDescending(na => na.CreatedDate)
                .ToListAsync();
        }

        public async Task<IEnumerable<NewsArticle>> SearchNewsAsync(string searchTerm)
        {
            return await _dbSet
                .Where(na => na.NewsStatus == true &&
                    (na.NewsTitle != null && na.NewsTitle.Contains(searchTerm) ||
                     na.Headline != null && na.Headline.Contains(searchTerm) ||
                     na.NewsContent != null && na.NewsContent.Contains(searchTerm)))
                .OrderByDescending(na => na.CreatedDate)
                .ToListAsync();
        }

        public async Task<IEnumerable<NewsArticle>> GetNewsByDateRangeAsync(DateTime startDate, DateTime endDate)
        {
            var endOfDay = endDate.Date.AddDays(1).AddTicks(-1);
            return await _dbSet
                .Where(na => na.CreatedDate >= startDate.Date && na.CreatedDate <= endOfDay)
                .OrderByDescending(na => na.CreatedDate)
                .ToListAsync();
        }

        public async Task<NewsArticle?> GetNewsWithTagsAsync(string id)
        {
            return await _dbSet
                .FirstOrDefaultAsync(na => na.NewsArticleID == id);
        }

        public async Task<NewsArticle?> GetByIdAsync(string id)
        {
            return await _dbSet
                .FirstOrDefaultAsync(na => na.NewsArticleID == id);
        }

        public async Task<List<int>> GetTagIdsByNewsIdAsync(string newsArticleId)
        {
            return await _context.NewsTags
                .Where(nt => nt.NewsArticleID == newsArticleId)
                .Select(nt => nt.TagID)
                .ToListAsync();
        }

        public override async Task UpdateAsync(NewsArticle entity)
        {
            entity.ModifiedDate = DateTime.Now;
            await base.UpdateAsync(entity);
        }
    }
}
