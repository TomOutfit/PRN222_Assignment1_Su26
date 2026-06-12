using NguyenBinhAn_A01_Data.Models;

namespace NguyenBinhAn_A01_Business.Repositories
{
    public interface ICategoryRepository : IRepository<Category>
    {
        Task<IEnumerable<Category>> GetActiveCategoriesAsync();
        Task<IEnumerable<Category>> GetParentCategoriesAsync();
        Task<IEnumerable<Category>> GetChildCategoriesAsync(short parentId);
        Task<bool> HasNewsArticlesAsync(short categoryId);
        Task<Category?> GetCategoryWithNewsCountAsync(short id);
    }
}
