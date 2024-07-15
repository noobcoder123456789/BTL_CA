#include <bits/stdc++.h>
using namespace std;

ifstream file_input; 
ofstream file_output;

void print_Array(int a[], int size) {
	for(int i = 0; i < size; i ++) {
		file_output << a[i] << " ";
	} file_output << "\n";
}

void swap(int* a, int* b) 
{ 
    int t = *a; 
    *a = *b; 
    *b = t; 
} 

// int partition(int arr[],int low,int high) {
// 	int pivot=arr[high];
// 	int i=(low-1);

// 	for(int j=low;j<=high;j++) {
// 		if(arr[j]<pivot) {
// 			i++;
// 			swap(arr[i],arr[j]);
// 		}
// 	}

// 	swap(arr[i+1],arr[high]);
// 	return (i+1);
// }
			
// void quickSort(int arr[],int low,int high) {
// 	if(low<high) {
// 		int pi=partition(arr,low,high);
// 		print_Array(arr, 10);
// 		quickSort(arr,low,pi-1);
// 		quickSort(arr,pi+1,high);
// 	}
// }

int partition(int arr[], int l, int h) 
{ 
    int x = arr[h]; 
    int i = (l - 1); 
  
    for (int j = l; j <= h - 1; j++) { 
        if (arr[j] <= x) { 
            i++; 
            swap(&arr[i], &arr[j]); 
        } 
    } 
    swap(&arr[i + 1], &arr[h]); 
    return (i + 1); 
} 
  
void quickSort(int arr[], int l, int h) { 
    int stack[50]; 
    int top = -1; 
	
	top += 1;
    stack[top] = l; 
	top += 1;
    stack[top] = h; 
  
    while (top >= 0) { 
        h = stack[top]; 
		top -= 1;
        l = stack[top]; 
		top -= 1;
  
        int p = partition(arr, l, h); 
		print_Array(arr, 50);
        if (p - 1 > l) { 
			top += 1;
            stack[top] = l; 
			top += 1;
            stack[top] = p - 1; 
        } 

        if (p + 1 < h) { 
			top += 1;
            stack[top] = p + 1; 
			top +=1;
            stack[top] = h; 
        } 
    } 
} 	

int main() {
    srand(time(NULL));
    // for(int q = 1; q <= 30; q ++) {
    //     fstream create_output;
    //     string s = "output_" + to_string(q) + ".txt";
    //     create_output.open(s, ios::out);
    // }

    for(int q = 1; q <= 30; q ++) {
        string s_input = "test_" + to_string(q) + ".txt";
        string s_output = "output_" + to_string(q) + ".txt";        
        file_input.open(s_input);
        file_output.open(s_output); 

        int arr[50];
        int i = 0;

        string INPUT_S;
        getline(file_input, INPUT_S);
        stringstream ss(INPUT_S);
        string word;
        while(ss >> word) {
            if(word[word.size() - 1] == ',') {
                string num = "";
                for(int j = 0; j + 1 < word.size(); j ++) {
                    num += word[j];
                }
                arr[i] = stoi(num);
            } else {
                arr[i] = stoi(word);
            }
            i++;
        }

        quickSort(arr, 0, 49);    
        file_input.close();
        file_output.close();
    }

    return 0;
}