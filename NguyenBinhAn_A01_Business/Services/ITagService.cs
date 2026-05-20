using NguyenBinhAn_A01_Data.Models;

namespace NguyenBinhAn_A01_Business.Services
{
    public interface ITagService
    {
        Task<IEnumerable<Tag>> GetAllTagsAsync();
        Task<Tag?> GetTagByIdAsync(int id);
        Task<Tag?> GetTagByNameAsync(string name);
        Task<Tag> CreateTagAsync(Tag tag);
        Task<Tag> UpdateTagAsync(Tag tag);
        Task DeleteTagAsync(int id);
        Task<IEnumerable<Tag>> GetPopularTagsAsync(int limit = 10);
        Task<bool> CanDeleteTagAsync(int tagId);
    }
}
