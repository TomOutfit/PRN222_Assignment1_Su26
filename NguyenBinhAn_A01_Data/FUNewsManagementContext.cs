using Microsoft.EntityFrameworkCore;
using NguyenBinhAn_A01_Data.Models;

namespace NguyenBinhAn_A01_Data
{
    public class FUNewsManagementContext : DbContext
    {
        public FUNewsManagementContext(DbContextOptions<FUNewsManagementContext> options) : base(options)
        {
        }

        public DbSet<SystemAccount> SystemAccounts { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<NewsArticle> NewsArticles { get; set; }
        public DbSet<Tag> Tags { get; set; }
        public DbSet<NewsTag> NewsTags { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Configure NewsTag composite key
            modelBuilder.Entity<NewsTag>()
                .HasKey(nt => new { nt.NewsArticleID, nt.TagID });

            // SystemAccount: no identity on AccountID
            modelBuilder.Entity<SystemAccount>()
                .Property(sa => sa.AccountID)
                .ValueGeneratedNever();

            // Tag: no identity on TagID
            modelBuilder.Entity<Tag>()
                .Property(t => t.TagID)
                .ValueGeneratedNever();

            // Category: identity on CategoryID
            modelBuilder.Entity<Category>()
                .Property(c => c.CategoryID)
                .ValueGeneratedOnAdd();

            // NewsArticle: no identity on NewsArticleID (string PK, set manually)
            modelBuilder.Entity<NewsArticle>()
                .Property(na => na.NewsArticleID)
                .ValueGeneratedNever();
        }
    }
}
