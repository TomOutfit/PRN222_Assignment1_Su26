using System.Linq.Expressions;

namespace NguyenBinhAn_A01_Business.Repositories
{
    public interface IRepository<T> where T : class
    {
        Task<T?> GetByIdAsync(object? id);
        Task<IEnumerable<T>> GetAllAsync();
        Task<IEnumerable<T>> FindAsync(Expression<Func<T, bool>> predicate);
        Task<T> AddAsync(T entity);
        Task UpdateAsync(T entity);
        Task DeleteAsync(T entity);
        Task<int> CountAsync(Expression<Func<T, bool>>? predicate = null);
    }
}
