using NguyenBinhAn_A01_Data.Models;

namespace NguyenBinhAn_A01_Business.Repositories
{
    public interface ISystemAccountRepository : IRepository<SystemAccount>
    {
        Task<SystemAccount?> GetByEmailAsync(string email);
        Task<SystemAccount?> AuthenticateAsync(string email, string password);
        Task<IEnumerable<SystemAccount>> GetAccountsByRoleAsync(short role);
    }
}
