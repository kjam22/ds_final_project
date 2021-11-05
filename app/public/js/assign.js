
const Asgn = {
    data() {
      return {
        "person": undefined,
        "assign":{},
        "assign2":{},
        "refereeForm": {},
        "selectedAssign": null,
        "selectedReferee": null,
        "game": [],
        "referee": [],
        "assignForm":{},

        }
    },
    methods: {
        // FetchReferee
        fetchAssignData(){
            fetch('/api/assign/')
            .then( response => response.json() )
            .then( (responseJson) => {
                console.log(responseJson);
                this.assign = responseJson;
                console.log(this.assign);
            })
            .catch( (err) => {
                console.log(this.assign);
                console.error(err);
            })
        },
        fetchAssignData2(){
            fetch('/api/assign/index2.php')
            .then( response => response.json() )
            .then( (responseJson) => {
                console.log(responseJson);
                this.assign2 = responseJson;
                console.log(this.assign2);
            })
            .catch( (err) => {
                console.log(this.assign2);
                console.error(err);
            })
        },
        fetchRefereeData(){
            fetch('/api/referee/')
            .then( response => response.json() )
            .then( (responseJson) => {
                console.log(responseJson);
                this.referee = responseJson;
                console.log(this.referee);
            })
            .catch( (err) => {
                console.log(this.referee);
                console.error(err);
            })
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
        postNewAssign(evt) {
            console.log("Posting:", this.assignForm);
            // alert("Posting!");
        
            fetch('api/assign/create.php', {
                method:'POST',
                body: JSON.stringify(this.assignForm),
                headers: {
                  "Content-Type": "application/json; charset=utf-8"
                }
              })
              .then( response => {
                this.fetchAssignData();
              })
  
          },

    // Update book
      postAssign(evt) {
            console.log ("Test:", this.selectedAssign);
            if (this.selectedAssign) {
                this.postEditAssign(evt);
            } else {
                this.postNewAssign(evt);
            }
        },

    postEditAssign(evt) {
        this.assignForm.id = this.selectedAssign.id;       

        console.log("Editing")
        fetch('api/assign/update.php', {
            method:'POST',
            body: JSON.stringify(this.assignForm),
            headers: {
                "Content-Type": "application/json; charset=utf-8"
                }
            })
            .then( response => response.json() )
            .then( json => {
            console.log("Returned from post:", json);
            // TODO: test a result was returned!
            this.assign = json;

            // reset the form
            this.handleResetEdit();
            });
        },
    //delete book
    postDeleteAssign(rf) {  
        console.log("############",rf)
        if ( !confirm("Are you sure you want to delete the game "  +" " +"?") ) {
            return;
        }  

        console.log("Delete!", rf);

        fetch('api/assign/delete.php', {
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
            this.assign = json;
            
            // reset the form
            this.handleResetEditAssign();
            });
        },

    
          handleEditAssign(book) {
            console.log("selecting", book);
            this.selectedAssign = book;
            this.assignForm = Object.assign({}, this.selectedAssign);
          },
          handleResetEditAssign() {
            this.selectedAssign = null;
            this.assignForm = {};
          }
    },
    created () {
        this.fetchGameData();
        this.fetchRefereeData();
        this.fetchAssignData();
        this.fetchAssignData2();
    } // end created
} // end Offer config
Vue.createApp(Asgn).mount('#assignjs');

console.log("Z");