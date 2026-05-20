using NguyenBinhAn_A01_Data.Models;

namespace NguyenBinhAn_A01_Business.Services
{
    public interface ISystemAccountService
    {
        Task<IEnumerable<SystemAccount>> GetAllAccountsAsync();
        Task<SystemAccount?> GetAccountByIdAsync(short id);
        Task<SystemAccount?> GetAccountByEmailAsync(string email);
        Task<SystemAccount> CreateAccountAsync(SystemAccount account);
        Task<SystemAccount> UpdateAccountAsync(SystemAccount account);
        Task DeleteAccountAsync(short id);
        Task<IEnumerable<SystemAccount>> GetAccountsByRoleAsync(short role);
        Task<bool> IsEmailExistsAsync(string email, short? excludeId = null);
        Task<short> GetNextAccountIdAsync();
    }
}
