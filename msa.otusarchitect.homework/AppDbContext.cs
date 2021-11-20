using Microsoft.EntityFrameworkCore;
using msa.otusarchitect.homework.Entities;

namespace msa.otusarchitect.homework
{
    public sealed class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }

        public DbSet<User> Users => Set<User>();
    }
}