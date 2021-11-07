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
        parseGames(){
          console.log("AAHAHAHAHAHAHAHAHAHA");
          let csvContent = "data:text/csv;charset=utf-8,";
          console.log("AVNI   ", this.games[0]);
          csvContent += Object.keys(this.games[0]).join(",")+"\r\n";
          this.games.forEach(function(rowObj) {
          let row = Object.values(rowObj).join(",");
          csvContent += row + "\r\n";
          console.log("##############",csvContent);
            //toCSV

        });
        var encodedUri = encodeURI(csvContent);
        var link = document.createElement("a");
        link.setAttribute("href", encodedUri);
        link.setAttribute("download", "my_data.csv");
        document.body.appendChild(link); // Required for FF
          console.log("AAAAAAAAAAAAAAA");
        link.click(); // This will download the data file named "my_data.csv"
        },
        
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
                console.log("posting:", json);
                this.games = json;
              })
              .catch( err => {
                alert("error");
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
                console.log("posting:", json);
                this.games = json;
                
              
              })
              .catch( err => {
                alert("error");
              });
          }, 
          
          listAssigned(evt){
            fetch('api/assign/index2.php', {
                method:'POST',
                body: JSON.stringify(this.gamesForm),
                headers: {
                  "Content-Type": "application/json; charset=utf-8"
                }
              })
              .then( response => response.json() )
              .then( json => {
                console.log("posting:", json);
                this.games = json;
              })
              .catch( err => {
                alert("error");
              });
          },
          fetchGameData(){
            fetch('/api/game/')
            .then( response => response.json() )
            .then( (responseJson) => {
                console.log(responseJson);
                this.game = responseJson;
                console.log(this.game);
            })
            .catch( (err) => {
                console.log(this.game);
                console.error(err);
            })
        },
    },
    created() {
        this.fetchRefereeData(); 
        this.fetchGameData();
    }
   
  
  }
  
  Vue.createApp(reportsApp).mount('#reportjs');
  
  // Resources : https://stackoverflow.com/questions/62975890/how-to-reload-refresh-a-webpage-in-vue-js-after-a-certain-event-or-a-button-is-c