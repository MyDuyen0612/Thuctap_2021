<template>
  <b-container class="register">
    <b-row>
      <b-col class="img d-flex justify-content-center" md="12">
          <img src="../assets/img/register.svg"/>
      </b-col>
      <b-col md="12">
      <b-form @submit="onSubmit" @reset="onReset" v-if="show" class="form">
      <b-form-group>
        <b-form-input
          id="input-1"
          v-model="form.email"
          :state="/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(form.email)? true: false"  
          type="email"
          placeholder="Email"
          required
        ></b-form-input>
      </b-form-group>
      <b-form-group>
        <b-form-input
          id="input-2"
          type="text"
          v-model="form.name"
          :state="form.name.length >= 5"
          placeholder="Tên"
          required
        ></b-form-input>
      </b-form-group>

      <b-form-group>
        <b-form-input
          id="input-3"
          v-model.trim="$v.form.password.$model"
          :state="form.password.length >= 6"
          type="password"
          placeholder="password"
          required
        ></b-form-input>
      </b-form-group>

      <div class="error" v-if="!$v.form.password.minLength">Password phai it nhat {{ $v.form.password.$params.minLength.min }} ky tu.</div>
      
      <b-form-group>
        <b-form-input
          id="input-4"
          v-model.trim="$v.form.repeatPassword.$model"
          :state="form.repeatPassword === form.password"
          type="password"
          placeholder="Repeat password"
          required
        ></b-form-input>
      </b-form-group>

      <div class="error" v-if="!$v.form.repeatPassword.sameAsPassword">Passwords phai trung nhau.</div>

      <b-form-group id="input-group-5" v-slot="{ ariaDescribedby }">
        <b-form-checkbox-group
          v-model="form.checked"
          id="checkboxes-5"
          :aria-describedby="ariaDescribedby"
        >
          <b-form-checkbox value="me">Remenber me</b-form-checkbox>
        </b-form-checkbox-group>
      </b-form-group>
      <div class="d-flex justify-content-around">
        <div>
           <b-button type="submit" id="btn">Submit
        <div class="spinner-border text-success" role="status" v-show="isActive">
          <span class="sr-only">Loading...</span>
        </div>
      </b-button>
        </div>
        <div>
          <b-button type="reset" style="background: red;">Reset</b-button>
        </div>
      </div>
      
    </b-form>
      </b-col>
    </b-row>

  </b-container>
</template>

<script>
import {sameAs, minLength } from 'vuelidate/lib/validators'
  export default {
    name: 'Register',
    data() {
      return {
        form: {
          email: '',
          name: '',
          password: '',
          repeatPassword: '',
        },
        show: true,
        isActive: false,
      }
    },
    validations: {
      form:{
        password: {minLength: minLength(6)},
        repeatPassword: {sameAsPassword: sameAs('password')},
      }
    },
    methods: {
      onSubmit(event) {
        event.preventDefault();
        this.isActive = !this.isActive;
        const form = new FormData;
        form.append("email",this.form.email);
        form.append("password", this.form.password);
        form.append("name",this.form.name);
        this.axios.post("http://127.0.0.1:8000/api/register",form).then((response)=>{
          this.isActive = !this.isActive;
          alert(response.data.message);
          this.$router.push("login");
        }).catch((error)=>{
          alert(error.message);
        })
      },
      onReset(event) {
        event.preventDefault()
        // Reset our form values
        this.form.email = ''
        this.form.name = ''
        this.form.password = ''
        this.form.repeatPassword = ''
        
        // Trick to reset/clear native browser form validation state
        this.show = false
        this.$nextTick(() => {
          this.show = true
        })
      }
    }
  }
</script>
<style lang="scss" scope>
.register{
  .error{
    font-size: 12px;
    color: red;
  }
  .img{
    justify-content: flex-end;
    align-items: center;
    img{
      width: 400px;
    }
  }
  .form{
    position: relative;
    margin-left: 10%;
    .form-group {
    input {
      font-size: 18px;
      padding: 10px 10px 10px 10px;
      display: block;
      width: 90%;
      border: none;
      border-bottom: 2px solid rgba(0, 0, 0, 0.3);
      background: none;
      }
    }
  }
  .btn{
  display: block;
	width: 100%;
	height: 45px;
	border-radius: 25px;
	outline: none;
	border: none;
	background-image: linear-gradient(to right, #32be8f, #38d39f, #32be8f);
	background-size: 200%;
	color: #fff;
	font-family: 'Poppins', sans-serif;
	text-transform: uppercase;
	margin: 0.5rem 0;
	cursor: pointer;
	transition: .5s;
  }
}
</style>
