using NguyenBinhAn_A01_Data.Models;

namespace NguyenBinhAn_A01_Business.Repositories
{
    public interface ITagRepository : IRepository<Tag>
    {
        Task<Tag?> GetByNameAsync(string name);
        Task<IEnumerable<Tag>> GetPopularTagsAsync(int limit = 10);
        Task<bool> IsTagInUseAsync(int tagId);
    }
}
