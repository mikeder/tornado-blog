node("docker") {
    docker.withRegistry('docker-01.sqweeb.net:32772/blog', '') {

        git url: "https://github.com/mikeder/tornado-blog.git", credentialsId: 'mikeder-github'

        sh "git rev-parse HEAD > .git/commit-id"
        def commit_id = readFile('.git/commit-id').trim()
        println commit_id

        stage "build"
        def app = docker.build "tornado-blog"

        stage "publish"
        app.push 'master'
        app.push "${commit_id}"
    }
}