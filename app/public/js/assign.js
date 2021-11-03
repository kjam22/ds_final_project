
const Asgn = {
    data() {
      return {
        "person": undefined,
        "assign":[],
        "refereeForm": {},
        "selectedReferee": null
        }
    },
    methods: {
        //FetchReferee
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
 
    },
    created() {
        
        this.fetchAssignData();
    } //end created
} // end Offer config
Vue.createApp(Asgn).mount('#assignjs');

console.log("Z");