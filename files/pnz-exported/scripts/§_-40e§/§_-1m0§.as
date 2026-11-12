package §_-40e§
{
   import flash.events.Event;
   
   public class §_-1m0§ extends Event
   {
      public static const §_-9FD§:String = "avatarChanged";
      
      public static const §_-3bw§:String = "avatarClothesChanged";
      
      public static const §_-2cL§:String = "avatarDrone";
      
      public static const §_-CGy§:String = "inventoryChanged";
      
      public static const §_-4YV§:String = "avatarResourcesChanged";
      
      public static const §_-2dd§:String = "resourcesChanged";
      
      public static const §_-0qm§:String = "houseChanged";
      
      public static const §_-4wQ§:String = "roomChanged";
      
      public static const §_-BgA§:String = "roomAdded";
      
      public static const §_-BXo§:String = "roomRenamed";
      
      public static const §_-9WQ§:String = "friendsChanged";
      
      public static const §_-7be§:String = "genderChanged";
      
      public static const §_-BZg§:String = "cityInfoChanged";
      
      public static const §_-0LF§:String = "visitersChanged";
      
      public static const §_-CVl§:String = "achievementsChanged";
      
      public static const §_-7in§:String = "avapacasCollectionAwardsReceived";
      
      public static const §_-8jC§:String = "leagueActivityChanged";
      
      public static const §_-7Cg§:String = "workInfoChanged";
      
      public static const §_-6V2§:String = "islandInfoChanged";
      
      public static const §_-Akp§:String = "newLevel";
      
      public static const §_-BPr§:String = "clanChanged";
      
      public static const §_-7Rk§:String = "mobileModelChanged";
      
      public static const §_-6aT§:String = "moduleInfoForViewerChanged";
      
      public static const §_-2Wf§:String = "chatDecorModelChanged";
      
      public static const §_-6O7§:String = "petInfoChanged";
      
      public static const §_-3D9§:String = "petCollectionChanged";
      
      public static const §_-5tD§:String = "vipInfoChanged";
      
      public static const §_-8Q0§:String = "collectionCardReceived";
      
      public static const §_-9B5§:String = "orderCompleted";
      
      private var §_-1DZ§:* = null;
      
      public function §_-1m0§(param1:String, param2:* = null)
      {
         super(param1,false,false);
         this.§_-1DZ§ = param2;
      }
      
      public function get object() : *
      {
         return this.§_-1DZ§;
      }
   }
}

