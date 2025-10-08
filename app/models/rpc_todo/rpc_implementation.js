import axios from "axios";
import { rpc } from "./rpc_config.js";
 
rpc.register({
  name: "fetchTodos",
  arguments: {
    api_key: { type: "string", required: true },
    page: { type: "number", required: false },
    per_page: { type: "number", required: false }
  },
  implementation: async (args) => {
    try {
      const res = await axios.get("http://localhost:3000/api/todos", {
        params: {
          page: args.page || 1,
          per_page: args.per_page || 10
        },
        headers: { Authorization: `Bearer ${args.api_key}` }
      });
 
      return {
        success: true,
        todos: res.data.todos,
        totalRowCount: res.data.pagination.total_count,  
        currentPage: res.data.pagination.current_page,   
        perPage: args.per_page || 10
      };
    } catch (err) {
      return { success: false, error: err.response?.data || err.message };
    }
  }
});
 
// ------------------------- SEARCH TODOS -------------------------
rpc.register({
  name: "searchTodos",
  arguments: {
    api_key: { type: "string", required: true },
    query: { type: "string" } // optional search term
  },
  implementation: async (args) => {
    try {
      const res = await axios.post(
        "http://localhost:3000/api/search_todos",
        { query: args.query || "" },
        {
          headers: {
            Authorization: `Bearer ${args.api_key}`,
            "Content-Type": "application/json",
            Accept: "application/json"
          }
        }
      );
 
      return { success: true, todos: res.data.todos };
    } catch (err) {
      return {
        success: false,
        status: err.response?.status,
        error: err.response?.data || err.message
      };
    }
  }
});
 
 
// ------------------------- CREATE TODO -------------------------
rpc.register({
  name: "createTodo",
  arguments: {
    title: { type: "string", required: true },
    description: { type: "string" },
    priority: { type: "string" },
    status: { type: "string" },
    scheduled_time: { type: "string" },
    expected_completion: { type: "string" },
    api_key: { type: "string", required: true },
  },
  implementation: async (args) => {
    try {
      const res = await axios.post(
        "http://localhost:3000/todos",
        {
          todo: {
            title: args.title,
            description: args.description,
            priority: args.priority,
            status: args.status,
            scheduled_time: args.scheduled_time,
            expected_completion: args.expected_completion,
          },
        },
        {
          headers: { Authorization: `Bearer ${args.api_key}` },
        }
      );
      return { success: true, createdTodo: res.data };
    } catch (err) {
      return { success: false, error: err.response?.data || err.message };
    }
  },
});
 
// ------------------------- UPDATE TODO -------------------------
rpc.register({
  name: "updateTodo",
  arguments: {
    id: { type: "string", required: true },
    title: { type: "string" },
    description: { type: "string" },
    priority: { type: "string" },
    status: { type: "string" },
    scheduled_time: { type: "string" },
    expected_completion: { type: "string" },
    api_key: { type: "string", required: true },
  },
  implementation: async (args) => {
    try {
      const res = await axios.put(
        `http://localhost:3000/todos/${args.id}`,
        {
          todo: {
            title: args.title,
            description: args.description,
            priority: args.priority,
            status: args.status,
            scheduled_time: args.scheduled_time,
            expected_completion: args.expected_completion,
          },
        },
        { headers: { Authorization: `Bearer ${args.api_key}` } }
      );
      return { success: true, updatedTodo: res.data };
    } catch (err) {
      return { success: false, error: err.response?.data || err.message };
    }
  },
});
 
// ------------------------- DELETE TODO -------------------------
rpc.register({
  name: "deleteTodo",
  arguments: {
    id: { type: "string", required: true },
    api_key: { type: "string", required: true },
  },
  implementation: async (args) => {
    try {
      await axios.delete(`http://localhost:3000/todos/${args.id}`, {
        headers: { Authorization: `Bearer ${args.api_key}` },
      });
      return { success: true, message: "Todo deleted successfully" };
    } catch (err) {
      return { success: false, error: err.response?.data || err.message };
    }
  },
});
 
// ------------------------- LOGIN -------------------------
rpc.register({
  name: "login",
  arguments: {
    email: { type: "string", required: true },
    password: { type: "string", required: true },
  },
  implementation: async (args) => {
    try {
      const res = await axios.post("http://localhost:3000/api/login", {
        email: args.email,
        password: args.password,
      });
      if (res.data.success && res.data.api_key) {
        return { success: true, api_key: res.data.api_key };
      } else {
        return { success: false, error: res.data.error || "Login failed" };
      }
    } catch (err) {
      return { success: false, error: err.response?.data || err.message };
    }
  },
});
 
// ------------------------- SIGNUP -------------------------
rpc.register({
  name: "signup",
  arguments: {
    name: { type: "string", required: true },
    email: { type: "string", required: true },
    password: { type: "string", required: true },
    password_confirmation: { type: "string", required: true },
  },
  implementation: async (args) => {
    try {
      const res = await axios.post("http://localhost:3000/api/signup", {
        name: args.name,
        email: args.email,
        password: args.password,
        password_confirmation: args.password_confirmation,
      }, {
        headers: { "Content-Type": "application/json" },
      });
 
      if (res.data.success && res.data.user?.api_key) {
        return { success: true, api_key: res.data.user.api_key };
      } else {
        return { success: false, error: res.data.error || res.data.message || "Signup failed" };
      }
    } catch (err) {
      return { success: false, error: err.response?.data || err.message };
    }
  },
});
 
// ------------------------- GET USERS -------------------------
rpc.register({
  name: "getUsers",
  arguments: {
    api_key: { type: "string", required: true },
  },
  implementation: async (args) => {
    try {
      const res = await axios.get("http://localhost:3000/api/users", {
        headers: { Authorization: `Bearer ${args.api_key}` },
      });
      return { success: true, users: res.data.users };
    } catch (err) {
      return { success: false, error: err.response?.data || err.message };
    }
  },
});
 
// ------------------------- LOGOUT -------------------------
rpc.register({
  name: "logout",
  arguments: {
    api_key: { type: "string", required: true }
  },
  implementation: async (args) => {
    try {
      const response = await fetch("http://localhost:3000/api/logout", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `Bearer ${args.api_key}`
        },
      });
 
      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.error || "Logout failed");
      }
 
      return await response.json();
    } catch (error) {
      return { success: false, message: error.message };
    }
  },
});
 
// ------------------------- GET PROFILE -------------------------
rpc.register({
  name: "getProfile",
  arguments: {
    api_key: { type: "string", required: true }
  },
  implementation: async (args) => {
    try {
      // Send API key in POST body (consistent with updateProfile)
      const res = await axios.post(
        "http://localhost:3000/api/getProfile",
        { api_key: args.api_key }, // body includes API key
        { headers: { "Content-Type": "application/json" } }
      );
 
      return { success: true, user: res.data.user };
    } catch (err) {
      console.error("[getProfile RPC] Error:", err.response?.data || err.message);
      return { success: false, error: err.response?.data || err.message };
    }
  },
});
 
// ------------------------- UPDATE PROFILE -------------------------
rpc.register({
  name: "updateProfile",
  arguments: {
    api_key: { type: "string", required: true },
    name: { type: "string" },
    photo_url: { type: "string" }
  },
  implementation: async (args) => {
    try {
      const res = await axios.post(
        "http://localhost:3000/api/updateProfile",
        {
          api_key: args.api_key,
          name: args.name,
          photo_url: args.photo_url
        },
        { headers: { "Content-Type": "application/json" } }
      );
 
      return {
        success: true,
        message: res.data.message,
        user: res.data.user
      };
    } catch (err) {
      console.error("[updateProfile RPC] Error:", err.response?.data || err.message);
      return { success: false, error: err.response?.data || err.message };
    }
  }
});
 
 

 