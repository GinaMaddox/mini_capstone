

/* global Vue, VueRouter, axios */
var SamplePage = {
  template: "#sample-page",
  data: function() {
    return {
      message: "Welcome to the Vue.js sample page!",
      
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};
var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      products: []
    };
  },
  created: function() {
    axios.get('/api/products').then(function(response) {
      console.log(response.data);
      this.products = response.data;
    }.bind(this));
    
  },
  methods: {},
  computed: {}
};



var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/api/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        email: this.email, password: this.password
      };
      axios
        .post("/api/sessions", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
  })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var ProductNewPage = {
  template: "#product-new-page",
  data: function() {
    return {
      name: "",
      price: "",
      description: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        price: this.price,
        description: this.description
      };
      axios
        .post("/api/products", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var ProductShowPage = {
  template: "#product-show-page",
  data: function() {
    return {
      name: "",
      price: "",
      description: "",
      errors: []
    };
  },
  created: function() {
    axios.get("/api/products/" + this.$route.params.id).then(function(response) {
      console.log(response.data);
      this.product = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
   
};

var ProductEditPage = {
  template: "#product-edit-page",
  data: function() {
    return {
      name: "",
      price: "",
      description: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        price: this.price,
        description: this.description
      };
      axios
        .patch("/api/products/" + this.$route, params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var ShoppingCartPage = {
  template: "#shoppingcart-page",
  data: function() {
    return {
      message: "This is your shopping cart!",
      products: []
    };
  },
  created: function() {
    axios.get('/api/carted_products').then(function(response) {
      console.log(response.data);
      this.products = response.data;
    }.bind(this));
    
  },
  methods: {},
  computed: {}
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/sample", component: SamplePage},
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/products/new", component: ProductNewPage },
    { path: "/shoppingcart", component: ShoppingCartPage },
    { path: "/products/:id", component: ProductShowPage },
    { path: "/products/:id/edit", component:ProductEditPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    console.log('jwt');
    console.log(jwt);
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});
