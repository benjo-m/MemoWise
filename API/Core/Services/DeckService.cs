using Core.Data;
using Core.DTOs;
using Core.Models;
using Microsoft.EntityFrameworkCore;

namespace Core.Services;

public class DeckService
{
    private ApplicationContext _context;

    public DeckService(ApplicationContext context)
    {
        _context = context;
    }

    public List<DeckDTO> GetDecks()
    {
        List<Deck> decks = _context.Decks
            .Include(d => d.Cards)
            .ThenInclude(c => c.Status)
            .ToList();

        var deckDtos = new List<DeckDTO>();

        foreach (var deck in decks) 
        { 
            deckDtos.Add(new DeckDTO(deck));
        }

        return deckDtos;
    }
}
