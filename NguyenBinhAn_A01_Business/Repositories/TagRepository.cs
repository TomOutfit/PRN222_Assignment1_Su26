using Microsoft.EntityFrameworkCore;
using NguyenBinhAn_A01_Data;
using NguyenBinhAn_A01_Data.Models;

namespace NguyenBinhAn_A01_Business.Repositories
{
    public class TagRepository : Repository<Tag>, ITagRepository
    {
        public TagRepository(FUNewsManagementContext context) : base(context)
        {
        }

        public async Task<Tag?> GetByNameAsync(string name)
        {
            return await _dbSet.FirstOrDefaultAsync(t => t.TagName == name);
        }

        public async Task<IEnumerable<Tag>> GetPopularTagsAsync(int limit = 10)
        {
            return await _context.NewsTags
                .GroupBy(nt => nt.TagID)
                .Select(g => new { TagID = g.Key, Count = g.Count() })
                .OrderByDescending(x => x.Count)
                .Take(limit)
                .Join(_dbSet, x => x.TagID, t => t.TagID, (x, t) => t)
                .ToListAsync();
        }

        public async Task<bool> IsTagInUseAsync(int tagId)
        {
            return await _context.NewsTags
                .AnyAsync(nt => nt.TagID == tagId);
        }
    }
}
