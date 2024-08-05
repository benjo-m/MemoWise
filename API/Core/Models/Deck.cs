namespace Core.Models;

public class Deck
{
    public int Id { get; set; }
    public string Title { get; set; }
    public int NewCards {  get; set; }
    public int LearningCards { get; set; }
    public int LearntCards { get; set; }

}
