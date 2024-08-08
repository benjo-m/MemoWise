using Core.DTOs;
using Core.Models;
using Microsoft.EntityFrameworkCore;

namespace Core.Data;

public class ApplicationContext : DbContext
{
    public DbSet<Card> Cards { get; set; }
    public DbSet<Deck> Decks { get; set; }
    public DbSet<CardStatus> CardStatuses { get; set; }

    public ApplicationContext(DbContextOptions<ApplicationContext> options)
        : base(options)
    {
    }
}