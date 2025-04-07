class sample;
static int data[$];
rand int a;
static int a_old;
static int size;
int count;
constraint data_c{
	data.size()==size;
	(a%2==0) -> a==0;
	(a%2==1) -> a==a_old+1;	
}

function void post_randomize();
	if(a%2==1) a_old=a;
	data.push_back(a);
	count++;
	if(a>9) a_old=0;
endfunction
endclass

module top;

sample s= new();
initial begin
s.size=50;
	repeat(50)begin 
		assert(s.randomize());
	end
	$write("data=%p",s.data);
end

endmodule
