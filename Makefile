init:
	cargo install leo-lang

nix_shell:
	nix-shell

build:
	@echo "👷 * Aleo Maci building process started *"
	@echo "========================================="
	@echo "🔨 1/3 Building the Server ..."""
	cargo build --release -p aleo-maci-server
	@echo "🔨 2/3 Building the CLI project..."
	cargo build --release -p aleo-maci-cli
	@echo "🔨 3/3 Building the Dashboard..."
	npm install --prefix dashboard --silent 
	npm run re:build --prefix dashboard
	@echo "==================================================="
	@echo "✅ Aleo Maci building process finished sucessfully!"

ops:
	redis-server --daemonize yes

stop_ops:
	redis-cli shutdown

ops_docker:
	docker-compose up -d redis

stop:
	redis-cli shutdown

stop_docker:
	docker-compose down redis	

run_server:
	HOST="localhost" REDIS_URL="redis://127.0.0.1:6379" cargo run --release -p aleo-maci-server

run_dashboard:
	PORT=4000 REACT_APP_MACI_HOST=http://127.0.0.1:3000 npm start --prefix dashboard

run_server_docker:
	docker-compose up server

test:
	cargo test

run_docker:
	docker compose up

build_images:
	docker compose build

format:
	cargo fmt --all

build_circuits:
	cd circuits/tally;leo build
	cd circuits/whitelist;leo build

run_tally_circuit:
	cd circuits/tally;leo run

run_whitelist_circuit:
	cd circuits/whitelist;leo run

clean_circuits:
	cd circuits/tally;leo clean

send_test_vote:
	cargo run --release --bin aleo-maci-cli vote-for 2 APrivateKey1zkpFgVh5ptpLgH39p2StPmRzAu14XPat415vRv6XmcR2Sun http://localhost:3000

send_vote:
	cargo run --release --bin aleo-maci-cli vote-for $(option) $(account) $(server)

start_tally:
	curl -X POST http://127.0.0.1:3000/election/tally/start

create_test_tally:
	curl --location --request POST 'http://127.0.0.1:3000/election/whitelist' \
	--header 'content-type: application/json' \
	--data-raw '{ \
		"accounts":[ \
			"aleo1nf0mhdl50j2r9afz7s40ew7h5glpgcenu297kvu2hjd3ve6mfqzqxpsf8p", \
			"aleo1vjpegjrnznedf5tqms5sz27t7xquddrtpfgta9x5uy2jeyhvccrqzdc0am", \
			"aleo1ak7j4g7g5lnqvqgs6kel0ahyu7wka33ezgxjgtxph7nrp3svtvzqt20a8j", \
			"aleo1fn4nhqs7gq0hswuyxux6kv3eejrv2pl2kylqv84h8cqpgzz5kvps8vysld", \
			"aleo1d4s2kapyztkg84gey34392jr08q4ecmk7huj2fngkym9d34mns8qyndjyd", \
			"aleo1stv68gsrt49vhcf2l0d28z66jzcgc9vaj0d2jsyw9m2fcpmmkqyqhxh7x8", \
			"aleo1qcytert7g239kf5k9yjspzzsl9msj5dpnk8dsex0tltesln6hgpqe4qww6", \
			"aleo1wk00zsmwxtp9wpjkkjt62duh5v4v9r79hpmdawv74z9a6fsen5zqt5ncgr", \
			"aleo1jg8yzwvszz3w8lg5dalxm57fw76yyfdcm7kz4tws3mmz4khyxgps02xz6x", \
			"aleo1pf50afyj34avea3xt6sr5e8q2zwyent2gw6thzfzwv4gzwtllgyqw7ckew", \
			"aleo1whx7lnmc8u8kdq40fkfa5xc3r8006a9qhjayr4dg2d5e6mek75xqhm48l4", \
			"aleo1wezl9psfx23nnv2xu50a3s56mtaaa330ld83ftnpmvzywxefc5pskqhr3s", \
			"aleo17w5a47jjete3j0yvrpu45wyf7d4p4rpte2a8dp90ze0996lj3g9q8v98my", \
			"aleo15rl68s3z23hlxd4d885cmjw5ycml2n3zv02qg3cc0h66lc4ync9sejkles", \
			"aleo10gttc60rpftr76qs2kfca32ajnj3l063utlvyq67e4mlhfc5gugqd5um8g", \
			"aleo1tfhhqvtujxncqdqxlsalehy8zjvlt50ywuw8qnw8xypxez7vmu9svkdvmp", \
			"aleo1rq5unh472yxwwghav87gzf66f949u74lj3rgz7u9m0yjlzquqvxqmks4ec", \
			"aleo1y4qgj3lay2vqhsfutjftlle8s0k2qltaqv5vf7hv2vgetuqgyu8q00ugt7", \
			"aleo1kymjjx9546mdsmv569nlcwreyxgwu8eqwu34fdqgxf4yzc3jqsyqx08fkh", \
			"aleo1z4wcppy3nx3akssvadh8rxmt8efthjxmy3r07pq05xpf4yq4r5zqdsvmu4", \
			"aleo1tunku4yxqjkq3456ewm8w5xx89f3wx7h8v35vez5phu20zysqurq4l2k28", \
			"aleo1fpvwdwkdzj4utcy7c5cq0p3ced9u5ga3grah95pdw9uhf4dvuv8qphmnqr", \
			"aleo1739j49vnmkl5u3askwwnxm7eldpt555ryhgjenhpt53f9dtkxuxq8k53jz", \
			"aleo1rml8q9la0e6d4vanqkul7qr6ptumz97tatmwsaqg8z5z8pusvsqs82gsgt", \
			"aleo1zyzk9m9y72h3xgasrekt9msflqax3akj2lywlv6hq7p5cq9tfgqs7yhg3e", \
			"aleo1syfu4vkkt9xgc2067ht8wr97lsx4t4hjsc83329yphj7djgg2vgs5jvr2j", \
			"aleo1yas7fck3sqquxtee32ngsnktkhuttq2fwwdgzvja3mpqxfehwgxs7tzpxz", \
			"aleo1njf3zqu4xx0ta7d7cy7urfude9942gw27wt4hr8hvpvrmqputy8sfzx2he", \
			"aleo1tgy9wgnrf9mcryzggzjrvxkffu7vg8krvmk9gaxswyw8z4cjagrqul3t4y", \
			"aleo1kzh6ahfpq9p70uhkjg5p9ew0ky2zh7n2w5tzq0kx4h9pfquktsrslg9xy3", \
			"aleo1dvyau6tuafmajm629psntqpq9d3mygxrrkjglyxcuhegxf7gl5zq7tee3k", \
			"aleo1cdwxtkxh7ndkdc2ja5rjek39qj9lyn00fz9mcwpfasasjrmk3uzs6ptd4j" \
		] \
	}'
