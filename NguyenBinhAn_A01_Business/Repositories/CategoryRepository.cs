using Microsoft.EntityFrameworkCore;
using NguyenBinhAn_A01_Data;
using NguyenBinhAn_A01_Data.Models;

namespace NguyenBinhAn_A01_Business.Repositories
{
    public class CategoryRepository : Repository<Category>, ICategoryRepository
    {
        public CategoryRepository(FUNewsManagementContext context) : base(context)
        {
        }

        public async Task<IEnumerable<Category>> GetActiveCategoriesAsync()
        {
            return await _dbSet
                .Where(c => c.IsActive == true)
                .OrderBy(c => c.CategoryName)
                .ToListAsync();
        }

        public async Task<IEnumerable<Category>> GetParentCategoriesAsync()
        {
            return await _dbSet
                .Where(c => c.ParentCategoryID == null && c.IsActive == true)
                .OrderBy(c => c.CategoryName)
                .ToListAsync();
        }

        public async Task<IEnumerable<Category>> GetChildCategoriesAsync(short parentId)
        {
            return await _dbSet
                .Where(c => c.ParentCategoryID == parentId && c.IsActive == true)
                .OrderBy(c => c.CategoryName)
                .ToListAsync();
        }

        public async Task<bool> HasNewsArticlesAsync(short categoryId)
        {
            return await _context.NewsArticles
                .AnyAsync(na => na.CategoryID == categoryId);
        }

        public async Task<Category?> GetCategoryWithNewsCountAsync(short id)
        {
            return await _dbSet
                .FirstOrDefaultAsync(c => c.CategoryID == id);
        }
    }
}
