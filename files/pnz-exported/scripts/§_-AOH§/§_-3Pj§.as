package §_-AOH§
{
   import §_-6Cn§.§_-5PQ§;
   import §_-7np§.§_-8rk§;
   import §_-ti§.§_-7E1§;
   import §_-ti§.§_-NM§;
   
   public class §_-3Pj§ extends §_-2Rj§
   {
      public function §_-3Pj§()
      {
         super("mcp");
      }
      
      override protected function createDescriptor() : §_-7E1§
      {
         var _loc1_:§_-7E1§ = new §_-7E1§("mcp","Connect to MCP Bridge server (localhost:9876)","mcp","client");
         _loc1_.§_-AqZ§("mcp","Connect to MCP Bridge");
         return _loc1_;
      }
      
      override protected function executeClient(param1:Object) : §_-NM§
      {
         §_-5PQ§.connect();
         log("Connecting to MCP Bridge...",§_-8rk§.COMMAND);
         return new §_-NM§(true,"MCP Bridge connection initiated");
      }
   }
}

