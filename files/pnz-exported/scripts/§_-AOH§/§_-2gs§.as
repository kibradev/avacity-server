package §_-AOH§
{
   import §_-18o§.§_-4gN§;
   import §_-ti§.§_-7E1§;
   import §_-ti§.§_-NM§;
   
   public class §_-2gs§ extends §_-2Rj§
   {
      public function §_-2gs§()
      {
         super("crc32");
      }
      
      override protected function createDescriptor() : §_-7E1§
      {
         return new §_-7E1§("crc32","Calculate CRC32","crc32","client");
      }
      
      override protected function executeClient(param1:Object) : §_-NM§
      {
         return new §_-NM§(true,"crc32: " + §_-4gN§.§_-5xQ§().toString(16));
      }
   }
}

