# 📚 Nouyuu (農友)

<strong><em>Currently some features work only for Japan</em></strong>

<img width="256" alt="nouyuu crop recommendations" src="https://user-images.githubusercontent.com/36095929/145031015-53990571-649b-46ce-87a9-58a3373e2e86.png">
<img width="568" alt="nouyuu garden" src="https://user-images.githubusercontent.com/36095929/145031029-1b42b320-8765-4deb-a279-38096e623eee.png">
<img width="255" alt="nouyuu garden index" src="https://user-images.githubusercontent.com/36095929/145031080-6c36a769-7303-455e-b228-f1c2d5d715db.png">


Nouyuu is a web application that looks to help people start a garden and manage it, or help people already gardening to manage theirs. It has a crops database with relevant information and makes recommendations based on your location and season.

<br>
App home: https://www.nouyuu.com
   

## Getting Started
### Setup

Install gems
```
bundle install
```
Install JS packages
```
yarn install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. For any APIs, see group Slack channel.
```
CLOUDINARY_URL=your_own_cloudinary_url_key
WEATHER_API = "your_open_weather_key"
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 6](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping

## Team Members
- [Matías Acuña](https://www.linkedin.com/in/agroang/)
- [Ryan Johnson](https://www.linkedin.com/in/ryan-joseph-johnson/)
- [Yatsenko Konstantin](https://www.linkedin.com/in/moahtdeep/)

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
