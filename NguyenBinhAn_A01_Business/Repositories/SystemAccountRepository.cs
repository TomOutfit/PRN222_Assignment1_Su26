using Microsoft.EntityFrameworkCore;
using NguyenBinhAn_A01_Data;
using NguyenBinhAn_A01_Data.Models;

namespace NguyenBinhAn_A01_Business.Repositories
{
    public class SystemAccountRepository : Repository<SystemAccount>, ISystemAccountRepository
    {
        public SystemAccountRepository(FUNewsManagementContext context) : base(context)
        {
        }

        public async Task<SystemAccount?> GetByEmailAsync(string email)
        {
            return await _dbSet.FirstOrDefaultAsync(sa =>
                sa.AccountEmail != null && sa.AccountEmail.ToLower() == email.ToLower());
        }

        public async Task<SystemAccount?> AuthenticateAsync(string email, string password)
        {
            return await _dbSet.AsNoTracking().FirstOrDefaultAsync(sa =>
                sa.AccountEmail != null && sa.AccountEmail.ToLower() == email.ToLower()
                && sa.AccountPassword == password);
        }

        public async Task<IEnumerable<SystemAccount>> GetAccountsByRoleAsync(short role)
        {
            return await _dbSet.Where(sa => sa.AccountRole == role).ToListAsync();
        }
    }
}
