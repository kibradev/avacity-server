package §_-Biv§
{
   import §_-0CA§.§_-BsT§;
   import §_-BeZ§.§_-4Ww§;
   import §_-ti§.§_-2Xl§;
   import §_-ti§.§_-4dj§;
   import §_-ti§.§_-7E1§;
   
   public class §_-5xm§ extends §_-3iK§
   {
      public function §_-5xm§()
      {
         super("add_campaign");
      }
      
      override protected function createDescriptor() : §_-7E1§
      {
         var _loc4_:* = undefined;
         var _loc1_:§_-7E1§ = new §_-7E1§(§_-C6H§,"Add campaign to server",§_-C6H§ + " -title [campaignTitle] -type [type] -campaign [json]","admin");
         _loc1_.addParameter(new §_-2Xl§("title","Campaign title",§_-4dj§.§_-BZk§).setRequired(true));
         var _loc2_:Array = [];
         var _loc3_:Array = §_-BsT§.§_-1FS§;
         for(_loc4_ in _loc3_)
         {
            _loc2_.push(_loc3_[_loc4_]["title"]);
         }
         _loc1_.addParameter(new §_-2Xl§("type","Campaign type",§_-4dj§.§_-1Pz§).setRequired(false,"MODULES").setPossibleValues(_loc2_));
         _loc1_.addParameter(new §_-2Xl§("items","Campaign items JSON array",§_-4dj§.§_-4PZ§).setRequired(true));
         _loc1_.§_-AqZ§(§_-C6H§ + " -title SAMPLE_CAMPAIGN -type SALE -items [{\"id\":0,\"cid\":0,\"tid\":\"item1\",\"si\":0,\"gl\":0,\"sc\":0}]","Add a sale campaign");
         _loc1_.§_-AqZ§(§_-C6H§ + " -title SAMPLE_CAMPAIGN -items [{\"id\":0,\"cid\":0,\"tid\":\"item1\",\"si\":0,\"gl\":0,\"sc\":0},{\"id\":0,\"cid\":0,\"tid\":\"item2\",\"si\":0,\"gl\":0,\"sc\":0}]","Add a module campaign");
         return _loc1_;
      }
      
      override protected function prepareParams(param1:Object) : §_-4Ww§
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.put("title",param1["title"]);
         var _loc3_:String = !!param1.hasOwnProperty("type") ? param1["type"] : "MODULES";
         _loc2_.put("type",§_-BsT§.§_-0Wi§(_loc3_));
         if(param1.hasOwnProperty("items"))
         {
            _loc2_.§_-6JD§("items",param1["items"]);
         }
         return _loc2_;
      }
   }
}

