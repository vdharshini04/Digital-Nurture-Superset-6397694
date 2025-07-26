import React from 'react';
import Post from './Post';

class Posts extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            posts: [],
            hasError: false
        };
    }
    loadPosts(){
        fetch("https://jsonplaceholder.typicode.com/posts")
            .then(res => res.json())
            .then(data => this.setState({ posts: data }))
            .catch(error => {
                console.error("Fetch error:", error);
                this.setState({ hasError: true });
            });
    }
    componentDidMount(){
        this.loadPosts();
    }
    render(){
        const { posts, hasError } = this.state;

        if (hasError) {
            return <h2>Something went wrong while loading posts.</h2>;
        }

        return (
            <div>
                <h1>Posts</h1>
                {posts.map(post => (
                    <div key={post.id}>
                        <h3>{post.title}</h3>
                        <p>{post.body}</p>
                        <hr />
                    </div>
                ))}
            </div>
        );
    }
    componentDidCatch(error,info){
        console.error("Caught an error:", error, info);
        alert("An error occurred in the Posts component.");
        this.setState({ hasError: true });
    }
}
export default Posts;