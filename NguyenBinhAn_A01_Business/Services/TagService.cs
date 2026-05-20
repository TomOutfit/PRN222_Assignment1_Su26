using NguyenBinhAn_A01_Data.Models;
using NguyenBinhAn_A01_Business.Repositories;

namespace NguyenBinhAn_A01_Business.Services
{
    public class TagService : ITagService
    {
        private readonly ITagRepository _tagRepository;

        public TagService(ITagRepository tagRepository)
        {
            _tagRepository = tagRepository;
        }

        public async Task<IEnumerable<Tag>> GetAllTagsAsync()
        {
            return await _tagRepository.GetAllAsync();
        }

        public async Task<Tag?> GetTagByIdAsync(int id)
        {
            return await _tagRepository.GetByIdAsync(id);
        }

        public async Task<Tag?> GetTagByNameAsync(string name)
        {
            return await _tagRepository.GetByNameAsync(name);
        }

        public async Task<Tag> CreateTagAsync(Tag tag)
        {
            return await _tagRepository.AddAsync(tag);
        }

        public async Task<Tag> UpdateTagAsync(Tag tag)
        {
            await _tagRepository.UpdateAsync(tag);
            return tag;
        }

        public async Task DeleteTagAsync(int id)
        {
            if (await CanDeleteTagAsync(id))
            {
                var tag = await _tagRepository.GetByIdAsync(id);
                if (tag != null)
                {
                    await _tagRepository.DeleteAsync(tag);
                }
            }
            else
            {
                throw new InvalidOperationException("Cannot delete tag because it is associated with news articles.");
            }
        }

        public async Task<IEnumerable<Tag>> GetPopularTagsAsync(int limit = 10)
        {
            return await _tagRepository.GetPopularTagsAsync(limit);
        }

        public async Task<bool> CanDeleteTagAsync(int tagId)
        {
            return !(await _tagRepository.IsTagInUseAsync(tagId));
        }
    }
}
