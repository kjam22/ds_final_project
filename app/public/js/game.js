
const Game = {
    data() {
      return {
        "game":[],
        "gameForm": {},
        "selectedGame": null
        }
    },
    computed: {
        prettyBirthday() {
            return dayjs(this.person.dob.date)
            .format('D MMM YYYY')
        }
    },
    methods: {
        //FetchGame
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
        postNewGame(evt) {
            console.log("Posting:", this.gameForm);
            // alert("Posting!");
        
            fetch('api/game/create.php', {
                method:'POST',
                body: JSON.stringify(this.gameForm),
                headers: {
                  "Content-Type": "application/json; charset=utf-8"
                }
              })
              .then( response => {
                this.fetchGameData();
              })
  
          },

    // Update book
      postGame(evt) {
            console.log ("Test:", this.selectedGame);
            if (this.selectedGame) {
                this.postEditGame(evt);
            } else {
                this.postNewGame(evt);
            }
        },

    postEditGame(evt) {
        this.gameForm.id = this.selectedGame.id;       

        console.log("Editing")
        fetch('api/game/update.php', {
            method:'POST',
            body: JSON.stringify(this.gameForm),
            headers: {
                "Content-Type": "application/json; charset=utf-8"
                }
            })
            .then( response => response.json() )
            .then( json => {
            console.log("Returned from post:", json);
            // TODO: test a result was returned!
            this.game = json;

            // reset the form
            this.handleResetEdit();
            });
        },
    //delete book
    postDeleteGame(rf) {  
        if ( !confirm("Are you sure you want to delete the game " +rf.field +" " +rf.gdate +"?") ) {
            return;
        }  

        console.log("Delete!", rf);

        fetch('api/game/delete.php', {
            method:'POST',
            body: JSON.stringify(rf),
            headers: {
                "Content-Type": "application/json; charset=utf-8"
            }
            })
            .then( response => response.json() )
            .then( json => {
            console.log("Returned from post:", json);
            // TODO: test a result was returned!
            this.game = json;

            // reset the form
            this.handleResetEditGame();
            });
        },

    
          handleEditGame(book) {
            console.log("selecting", book);
            this.selectedGame = book;
            this.gameForm = Object.assign({}, this.selectedGame);
          },
          handleResetEditGame() {
            this.selectedGame = null;
            this.gameForm = {};
          }
    },
    created() {
        
        this.fetchGameData();
    } //end created
} // end Offer config
Vue.createApp(Game).mount('#gamejs');
