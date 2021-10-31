
const Offer = {
    data() {
      return {
        "person": undefined,
        "referee":[],
        "refereeForm": {},
        "selectedReferee": null
        }
    },
    computed: {
        prettyBirthday() {
            return dayjs(this.person.dob.date)
            .format('D MMM YYYY')
        }
    },
    methods: {
        //FetchReferee
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
        postNewReferee(evt) {
            console.log("Posting:", this.refereeForm);
            // alert("Posting!");
        
            fetch('api/referee/create.php', {
                method:'POST',
                body: JSON.stringify(this.refereeForm),
                headers: {
                  "Content-Type": "application/json; charset=utf-8"
                }
              })
              .then( response => {
                this.fetchRefereeData();
              })
  
          },

    // Update book
      postReferee(evt) {
            console.log ("Test:", this.selectedReferee);
            if (this.selectedReferee) {
                this.postEditReferee(evt);
            } else {
                this.postNewReferee(evt);
            }
        },

    postEditReferee(evt) {
        this.refereeForm.id = this.selectedReferee.id;       

        console.log("Editing")
        fetch('api/referee/update.php', {
            method:'POST',
            body: JSON.stringify(this.refereeForm),
            headers: {
                "Content-Type": "application/json; charset=utf-8"
                }
            })
            .then( response => response.json() )
            .then( json => {
            console.log("Returned from post:", json);
            // TODO: test a result was returned!
            this.referee = json;

            // reset the form
            this.handleResetEdit();
            });
        },
    //delete book
    postDeleteReferee(rf) {  
        if ( !confirm("Are you sure you want to delete the offer from " +rf.firstname +" " +rf.lastname +"?") ) {
            return;
        }  

        console.log("Delete!", rf);

        fetch('api/referee/delete.php', {
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
            this.referee = json;

            // reset the form
            this.handleResetEditReferee();
            });
        },

    
          handleEditReferee(book) {
            console.log("selecting", book);
            this.selectedReferee = book;
            this.refereeForm = Object.assign({}, this.selectedReferee);
          },
          handleResetEditReferee() {
            this.selectedReferee = null;
            this.refereeForm = {};
          }
    },
    created() {
        
        this.fetchRefereeData();
    } //end created
} // end Offer config
Vue.createApp(Offer).mount('#offerApp');

console.log("Z");