using Core.Models;

namespace Core.DTOs;

public class DeckDTO
{
    public int Id { get; set; }
    public string Title { get; set; }
    public ICollection<CardDTO> Cards { get; set; } = new List<CardDTO>();

    public DeckDTO(Deck deck)
    {
        Id = deck.Id;
        Title = deck.Title;
        foreach (Card card in deck.Cards)
        {
            Cards.Add(new CardDTO(card));
        }
    }
}
