public with sharing class TrackExtension {

	public Track__c track{get; set;}
	public PicklistController picklistController{get; set;}

	public TrackExtension(){
		// Création de l'objet Track utilisé dans le formulaire
		this.track = new Track__c();
		
		// Contrôleur du composant
		this.picklistController = new PicklistController();
		
		this.picklistController.albums = this.getAlbumsBDD();
	}
	
	// Lorsque l'on valide le formulaire
	public PageReference save(){
		this.track.Album__c = this.picklistController.value;
		insert track;
		
		return new PageReference('/'+track.Id);
	}
	
	// Récupération des albums
	public List<SelectOption> getAlbumsBDD(){
        List<SelectOption> options = new List<SelectOption>();
        
        List<Album__c> albums = [
            SELECT id, Name
            FROM Album__c
        ];     
        
        for(Album__c album : albums){
            options.add(new SelectOption(album.Id, album.Name));
        }
        
        return options;
    }
}