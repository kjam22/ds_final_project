
const Asgn = {
    data() {
      return {
        "person": undefined,
        "assign":{},
        "refereeForm": {},
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
    },
    created () {
        this.fetchGameData();
        this.fetchRefereeData();
        this.fetchAssignData();
    } // end created
} // end Offer config
Vue.createApp(Asgn).mount('#assignjs');

console.log("Z");