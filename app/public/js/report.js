const reportsApp = {
    data() {
      return {
        games: [],
        referees : [],
        gamesForm: {},
        gameReportsForm : {},
            
      
      }
    },
    computed: {},
    methods: {
        UnassignedFutureGames(evt){

            fetch('api/reports/unassignedfuturegames.php', {
                method:'POST',
                body: JSON.stringify(this.gamesForm),
                headers: {
                  "Content-Type": "application/json; charset=utf-8"
                }
              })
              .then( response => response.json() )
              .then( json => {
                console.log("Returned from post:", json);
                // TODO: test a result was returned!
                this.games = json;
                
              
              })
              .catch( err => {
                alert("Something went wrong.");
              });
          },
          fetchRefereeData() {
            fetch('/api/referee/')
            .then( response => response.json() )
              .then( (responseJson) => {
                  console.log(responseJson);
                  this.referees = responseJson;
              })
              .catch( err => {
                console.error("ERROR", err);
              });
          },
          listGamesDateRange(evt){
             fetch('api/reports/daterange.php', {
                method:'POST',
                body: JSON.stringify(this.gameReportsForm),
                headers: {
                  "Content-Type": "application/json; charset=utf-8"
                }
              })
              .then( response => response.json() )
              .then( json => {
                console.log("Returned from post:", json);
                this.games = json;
                
              
              })
              .catch( err => {
                alert("Oops, we have an error. Can you try again with correct values.");
              });
          }, 

    },
    created() {
        this.fetchRefereeData(); 
    }
   
  
  }
  
  Vue.createApp(reportsApp).mount('#reportjs');
  
  // Resources : https://stackoverflow.com/questions/62975890/how-to-reload-refresh-a-webpage-in-vue-js-after-a-certain-event-or-a-button-is-c