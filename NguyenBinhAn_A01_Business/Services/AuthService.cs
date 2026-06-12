using Microsoft.Extensions.Configuration;
using NguyenBinhAn_A01_Data.Models;
using NguyenBinhAn_A01_Business.Repositories;

namespace NguyenBinhAn_A01_Business.Services
{
    public class AuthService : IAuthService
    {
        private readonly ISystemAccountRepository _systemAccountRepository;
        private readonly IConfiguration _configuration;

        public AuthService(ISystemAccountRepository systemAccountRepository, IConfiguration configuration)
        {
            _systemAccountRepository = systemAccountRepository;
            _configuration = configuration;
        }

        public async Task<SystemAccount?> AuthenticateAsync(string email, string password)
        {
            // First check if it's the admin account from appsettings.json
            var adminEmail = _configuration["AdminAccount:Email"];
            var adminPassword = _configuration["AdminAccount:Password"];
            
            if (email == adminEmail && password == adminPassword)
            {
                // Return a virtual admin account (not saved to database)
                return new SystemAccount
                {
                    AccountID = 0, // Virtual ID
                    AccountName = "Administrator",
                    AccountEmail = adminEmail!,
                    AccountPassword = adminPassword!,
                    AccountRole = 0 // Admin role
                };
            }
            
            // Check in database for other accounts
            return await _systemAccountRepository.AuthenticateAsync(email, password);
        }

        public async Task<SystemAccount> GetAdminAccountAsync()
        {
            var adminEmail = _configuration["AdminAccount:Email"];
            var adminPassword = _configuration["AdminAccount:Password"];

            var adminAccount = await _systemAccountRepository.GetByEmailAsync(adminEmail!);
            
            if (adminAccount == null)
            {
                // Create admin account if it doesn't exist
                adminAccount = new SystemAccount
                {
                    AccountName = "Administrator",
                    AccountEmail = adminEmail!,
                    AccountPassword = adminPassword!,
                    AccountRole = 0 // Admin role
                };
                await _systemAccountRepository.AddAsync(adminAccount);
            }
            else
            {
                // Update admin password if it doesn't match
                if (adminAccount.AccountPassword != adminPassword)
                {
                    adminAccount.AccountPassword = adminPassword!;
                    await _systemAccountRepository.UpdateAsync(adminAccount);
                }
            }

            return adminAccount;
        }
    }
}
