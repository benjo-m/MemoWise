namespace Core.Models;

public class Deck
{
    public int Id { get; set; }
    public string Title { get; set; }
    public ICollection<Card> Cards { get; set; } = new List<Card>();
}
