using Microsoft.EntityFrameworkCore;
using NguyenBinhAn_A01_Data;
using NguyenBinhAn_A01_Data.Models;
using NguyenBinhAn_A01_Business.Repositories;

namespace NguyenBinhAn_A01_Business.Services
{
    public class SystemAccountService : ISystemAccountService
    {
        private readonly ISystemAccountRepository _systemAccountRepository;
        private readonly FUNewsManagementContext _context;

        public SystemAccountService(ISystemAccountRepository systemAccountRepository, FUNewsManagementContext context)
        {
            _systemAccountRepository = systemAccountRepository;
            _context = context;
        }

        public async Task<IEnumerable<SystemAccount>> GetAllAccountsAsync()
        {
            return await _systemAccountRepository.GetAllAsync();
        }

        public async Task<SystemAccount?> GetAccountByIdAsync(short id)
        {
            return await _context.SystemAccounts
                .FirstOrDefaultAsync(a => a.AccountID == id);
        }

        public async Task<SystemAccount?> GetAccountByEmailAsync(string email)
        {
            return await _systemAccountRepository.GetByEmailAsync(email);
        }

        public async Task<SystemAccount> CreateAccountAsync(SystemAccount account)
        {
            // Auto-generate AccountID since DB has no IDENTITY
            account.AccountID = await GetNextAccountIdAsync();
            return await _systemAccountRepository.AddAsync(account);
        }

        public async Task<SystemAccount> UpdateAccountAsync(SystemAccount account)
        {
            await _systemAccountRepository.UpdateAsync(account);
            return account;
        }

        public async Task DeleteAccountAsync(short id)
        {
            var account = await GetAccountByIdAsync(id);
            if (account != null)
            {
                await _systemAccountRepository.DeleteAsync(account);
            }
        }

        public async Task<IEnumerable<SystemAccount>> GetAccountsByRoleAsync(short role)
        {
            return await _systemAccountRepository.GetAccountsByRoleAsync(role);
        }

        public async Task<bool> IsEmailExistsAsync(string email, short? excludeId = null)
        {
            return await _context.SystemAccounts
                .AnyAsync(a => a.AccountEmail == email && (excludeId == null || a.AccountID != excludeId));
        }

        public async Task<short> GetNextAccountIdAsync()
        {
            var maxId = await _context.SystemAccounts
                .MaxAsync(a => (short?)a.AccountID) ?? 0;
            return (short)(maxId + 1);
        }
    }
}
