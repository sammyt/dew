package simple.example
{
  public class BlobMediator
  {
    private var blob:Blob;
    
    public function BlobMediator(blob:Blob)
    {
      this.blob = blob;
      trace(blob);
    }
  }
}