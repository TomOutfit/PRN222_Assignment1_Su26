using NguyenBinhAn_A01_Data.Models;
using NguyenBinhAn_A01_Business.Repositories;

namespace NguyenBinhAn_A01_Business.Services
{
    public class CategoryService : ICategoryService
    {
        private readonly ICategoryRepository _categoryRepository;

        public CategoryService(ICategoryRepository categoryRepository)
        {
            _categoryRepository = categoryRepository;
        }

        public async Task<IEnumerable<Category>> GetActiveCategoriesAsync()
        {
            return await _categoryRepository.GetActiveCategoriesAsync();
        }

        public async Task<Category?> GetCategoryByIdAsync(short id)
        {
            return await _categoryRepository.GetByIdAsync(id);
        }

        public async Task<IEnumerable<Category>> GetParentCategoriesAsync()
        {
            return await _categoryRepository.GetParentCategoriesAsync();
        }

        public async Task<IEnumerable<Category>> GetChildCategoriesAsync(short parentId)
        {
            return await _categoryRepository.GetChildCategoriesAsync(parentId);
        }

        public async Task<Category> CreateCategoryAsync(Category category)
        {
            category.IsActive = true;
            return await _categoryRepository.AddAsync(category);
        }

        public async Task<Category> UpdateCategoryAsync(Category category)
        {
            await _categoryRepository.UpdateAsync(category);
            return category;
        }

        public async Task DeleteCategoryAsync(short id)
        {
            if (await CanDeleteCategoryAsync(id))
            {
                var category = await _categoryRepository.GetByIdAsync(id);
                if (category != null)
                {
                    await _categoryRepository.DeleteAsync(category);
                }
            }
            else
            {
                throw new InvalidOperationException("Cannot delete category because it is associated with news articles.");
            }
        }

        public async Task<bool> CanDeleteCategoryAsync(short categoryId)
        {
            return !(await _categoryRepository.HasNewsArticlesAsync(categoryId));
        }

        public async Task<int> GetCategoryCountAsync()
        {
            return await _categoryRepository.CountAsync(c => c.IsActive == true);
        }
    }
}
