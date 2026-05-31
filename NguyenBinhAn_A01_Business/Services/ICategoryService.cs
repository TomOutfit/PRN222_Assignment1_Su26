using NguyenBinhAn_A01_Data.Models;

namespace NguyenBinhAn_A01_Business.Services
{
    public interface ICategoryService
    {
        Task<IEnumerable<Category>> GetActiveCategoriesAsync();
        Task<Category?> GetCategoryByIdAsync(short id);
        Task<IEnumerable<Category>> GetParentCategoriesAsync();
        Task<IEnumerable<Category>> GetChildCategoriesAsync(short parentId);
        Task<Category> CreateCategoryAsync(Category category);
        Task<Category> UpdateCategoryAsync(Category category);
        Task DeleteCategoryAsync(short id);
        Task<bool> CanDeleteCategoryAsync(short categoryId);
        Task<int> GetCategoryCountAsync();
    }
}
