using Core.Models;
using Microsoft.AspNetCore.Mvc;

namespace Core.Controllers;

[Route("api/[controller]")]
[ApiController]
public class DeckController : ControllerBase
{
    private List<Deck> _decks = new List<Deck>()
    {
        new Deck() { Id = 1, Title = "Geography", NewCards = 10, LearningCards = 21, LearntCards = 15 },
        new Deck() { Id = 2, Title = "Design Patterns", NewCards = 5, LearningCards = 12, LearntCards = 5 },
        new Deck() { Id = 3, Title = "Finance", NewCards = 15, LearningCards = 6, LearntCards = 23 },
        new Deck() { Id = 4, Title = "Astronomy", NewCards = 7, LearningCards = 19, LearntCards = 8 },
        new Deck() { Id = 5, Title = "History", NewCards = 14, LearningCards = 44, LearntCards = 32 },
        new Deck() { Id = 6, Title = "Flutter", NewCards = 13, LearningCards = 21, LearntCards = 15 },
        new Deck() { Id = 7, Title = "Programming", NewCards = 12, LearningCards = 18, LearntCards = 20 },
        new Deck() { Id = 8, Title = "Philosophy", NewCards = 8, LearningCards = 14, LearntCards = 18 },
        new Deck() { Id = 9, Title = "Networking", NewCards = 12, LearningCards = 11, LearntCards = 23 },

    };

    [HttpGet]
    public List<Deck> GetDecks()
    {
        return _decks;
    }
}
