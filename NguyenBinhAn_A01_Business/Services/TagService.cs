using Microsoft.Extensions.DependencyInjection;
using NguyenBinhAn_A01_Data.Models;
using NguyenBinhAn_A01_Business.Repositories;

namespace NguyenBinhAn_A01_Business.Services
{
    public class TagService : ITagService
    {
        private readonly IServiceScopeFactory _scopeFactory;

        public TagService(IServiceScopeFactory scopeFactory)
        {
            _scopeFactory = scopeFactory;
        }

        public async Task<IEnumerable<Tag>> GetAllTagsAsync()
        {
            using var scope = _scopeFactory.CreateScope();
            var _tagRepository = scope.ServiceProvider.GetRequiredService<ITagRepository>();
            return await _tagRepository.GetAllAsync();
        }

        public async Task<Tag?> GetTagByIdAsync(int id)
        {
            using var scope = _scopeFactory.CreateScope();
            var _tagRepository = scope.ServiceProvider.GetRequiredService<ITagRepository>();
            return await _tagRepository.GetByIdAsync(id);
        }

        public async Task<Tag?> GetTagByNameAsync(string name)
        {
            using var scope = _scopeFactory.CreateScope();
            var _tagRepository = scope.ServiceProvider.GetRequiredService<ITagRepository>();
            return await _tagRepository.GetByNameAsync(name);
        }

        public async Task<Tag> CreateTagAsync(Tag tag)
        {
            using var scope = _scopeFactory.CreateScope();
            var _tagRepository = scope.ServiceProvider.GetRequiredService<ITagRepository>();
            return await _tagRepository.AddAsync(tag);
        }

        public async Task<Tag> UpdateTagAsync(Tag tag)
        {
            using var scope = _scopeFactory.CreateScope();
            var _tagRepository = scope.ServiceProvider.GetRequiredService<ITagRepository>();
            await _tagRepository.UpdateAsync(tag);
            return tag;
        }

        public async Task DeleteTagAsync(int id)
        {
            if (await CanDeleteTagAsync(id))
            {
                using var scope = _scopeFactory.CreateScope();
                var _tagRepository = scope.ServiceProvider.GetRequiredService<ITagRepository>();
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
            using var scope = _scopeFactory.CreateScope();
            var _tagRepository = scope.ServiceProvider.GetRequiredService<ITagRepository>();
            return await _tagRepository.GetPopularTagsAsync(limit);
        }

        public async Task<bool> CanDeleteTagAsync(int tagId)
        {
            using var scope = _scopeFactory.CreateScope();
            var _tagRepository = scope.ServiceProvider.GetRequiredService<ITagRepository>();
            return !(await _tagRepository.IsTagInUseAsync(tagId));
        }
    }
}
